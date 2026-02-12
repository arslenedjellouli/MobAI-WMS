# MobAI Architecture Diagrams

## Clean Architecture Overview

```mermaid
graph TB
    subgraph "Presentation Layer"
        UI[Pages & Widgets]
        BLOC[BLoC State Management]
        UI --> BLOC
    end

    subgraph "Domain Layer - Pure Business Logic"
        UC[Use Cases]
        REPO_INT[Repository Interfaces]
        ENT[Entities]
        UC --> REPO_INT
        UC --> ENT
    end

    subgraph "Data Layer"
        REPO_IMPL[Repository Implementations]
        DS_REMOTE[Remote Data Source - API]
        DS_LOCAL[Local Data Source - Cache]
        MODEL[Models - JSON Serialization]
        REPO_IMPL --> DS_REMOTE
        REPO_IMPL --> DS_LOCAL
        REPO_IMPL --> MODEL
    end

    subgraph "External"
        API[Backend API]
        DB[Local SQLite]
        CACHE[SharedPreferences]
        SECURE[Secure Storage]
        DS_REMOTE --> API
        DS_LOCAL --> DB
        DS_LOCAL --> CACHE
        DS_LOCAL --> SECURE
    end

    BLOC --> UC
    REPO_IMPL -.implements.-> REPO_INT

    style UI fill:#e3f2fd
    style BLOC fill:#bbdefb
    style UC fill:#c8e6c9
    style REPO_INT fill:#a5d6a7
    style ENT fill:#81c784
    style REPO_IMPL fill:#fff9c4
    style DS_REMOTE fill:#ffecb3
    style DS_LOCAL fill:#ffe082
    style MODEL fill:#ffd54f
    style API fill:#ffccbc
    style DB fill:#ffab91
    style CACHE fill:#ff8a65
    style SECURE fill:#ff7043
```

## Login Flow Example

```mermaid
sequenceDiagram
    actor User
    participant UI as LoginPage
    participant Bloc as AuthBloc
    participant UC as LoginUseCase
    participant Repo as AuthRepository
    participant Remote as RemoteDataSource
    participant API as Backend API
    participant Local as LocalDataSource

    User->>UI: Enter email & password
    User->>UI: Press Login
    UI->>Bloc: LoginRequested event
    Bloc->>UC: call(LoginParams)
    UC->>UC: Validate email format
    UC->>Repo: login(email, password)
    Repo->>Remote: login(email, password)
    Remote->>API: POST /auth/login
    API-->>Remote: {user, tokens}
    Remote-->>Repo: UserModel
    Repo->>Local: saveTokens(access, refresh)
    Repo->>Local: saveUser(userJson)
    Local-->>Repo: Success
    Repo-->>UC: Right(UserEntity)
    UC-->>Bloc: Right(UserEntity)
    Bloc->>Bloc: emit(Authenticated)
    Bloc-->>UI: Authenticated state
    UI->>UI: Navigate to Dashboard
```

## Feature Organization

```mermaid
graph TB
    subgraph "lib/"
        MAIN[main.dart]
        
        subgraph "config/"
            DI[di/injection_container.dart]
            ROUTES[routes/app_routes.dart]
            THEME[theme/app_theme.dart]
        end
        
        subgraph "core/"
            CONST[constants/]
            ERR[errors/]
            NET[network/network_service.dart]
            STOR[storage/]
            UTIL[utils/]
        end
        
        subgraph "shared/"
            SHARED_DOM[domain/either.dart, usecase.dart]
            SHARED_PRES[presentation/widgets/]
        end
        
        subgraph "features/"
            AUTH[auth/ - IN PROGRESS]
            DASH[dashboard/ - TODO]
            PICK[bon_picking/ - TODO]
            REPL[bon_replenishment/ - TODO]
            OTHER[15 more features...]
        end
    end
    
    MAIN --> DI
    MAIN --> ROUTES
    MAIN --> THEME
    AUTH --> SHARED_DOM
    AUTH --> SHARED_PRES
    AUTH --> CORE
    
    style MAIN fill:#1E88E5,color:#fff
    style AUTH fill:#43A047,color:#fff
    style CONST fill:#81c784
    style NET fill:#81c784
    style SHARED_DOM fill:#81c784
```

## Data Flow - BLoC Pattern

```mermaid
stateDiagram-v2
    [*] --> Initial
    Initial --> Loading: LoginRequested event
    Loading --> Authenticated: Login Success
    Loading --> Unauthenticated: Login Failure
    Authenticated --> Loading: LogoutRequested
    Loading --> Unauthenticated: Logout Success
    Unauthenticated --> Loading: LoginRequested
    Authenticated --> [*]
    Unauthenticated --> [*]
```

## Offline Sync Strategy

```mermaid
graph LR
    subgraph "User Action"
        A1[Create Bon Picking]
        A2[Update Stock]
        A3[Scan Barcode]
    end
    
    subgraph "Check Connectivity"
        B1{Is Online?}
    end
    
    subgraph "Online Flow"
        C1[Call API]
        C2[Update Local DB]
        C3[Update UI]
    end
    
    subgraph "Offline Flow"
        D1[Save to Sync Queue]
        D2[Update Local DB]
        D3[Update UI - Pending]
        D4[Background Sync Service]
        D5{Online?}
        D6[Process Queue]
        D7[Update API]
        D8[Update UI - Synced]
    end
    
    A1 --> B1
    A2 --> B1
    A3 --> B1
    
    B1 -->|Yes| C1
    C1 --> C2
    C2 --> C3
    
    B1 -->|No| D1
    D1 --> D2
    D2 --> D3
    D3 --> D4
    D4 --> D5
    D5 -->|Yes| D6
    D6 --> D7
    D7 --> D8
    D5 -->|No| D4
    
    style C1 fill:#43A047,color:#fff
    style D1 fill:#FB8C00,color:#fff
```

## VRAC Workflow (Database)

```mermaid
graph LR
    subgraph "Zone Flow"
        Z1[RECEIVING Zone]
        Z2[VRAC Zone - Bulk Storage]
        Z3[PICKING Zone - Ready for Orders]
        Z4[EXPEDITION Zone]
    end
    
    subgraph "Stock Operations"
        O1[Bon Commande - Receive]
        O2[Bon Replenishment - Transfer]
        O3[Bon Picking - Prepare]
        O4[Bon Livraison - Ship]
    end
    
    O1 --> Z1
    Z1 --> Z2
    O2 -.triggers when low.-> Z3
    Z2 --> Z3
    O3 --> Z3
    Z3 --> Z4
    O4 --> Z4
    
    style Z2 fill:#9C27B0,color:#fff
    style O2 fill:#2196F3,color:#fff
```

## AI Integration Points

```mermaid
graph TB
    subgraph "AI Services"
        AI1[Optimal Picking Path]
        AI2[Stock Prediction]
        AI3[Replenishment Triggers]
        AI4[Location Assignment]
    end
    
    subgraph "Use Cases"
        UC1[GetOptimalPickingPathUseCase]
        UC2[PredictStockNeedsUseCase]
        UC3[TriggerReplenishmentUseCase]
        UC4[AssignOptimalLocationUseCase]
    end
    
    subgraph "Features"
        F1[Bon Picking]
        F2[Stock Management]
        F3[Bon Replenishment]
        F4[Location Management]
    end
    
    F1 --> UC1
    F2 --> UC2
    F3 --> UC3
    F4 --> UC4
    
    UC1 --> AI1
    UC2 --> AI2
    UC3 --> AI3
    UC4 --> AI4
    
    AI1 -.API call.-> EXT[AI Backend Service]
    AI2 -.API call.-> EXT
    AI3 -.API call.-> EXT
    AI4 -.API call.-> EXT
    
    style AI1 fill:#E91E63,color:#fff
    style AI2 fill:#E91E63,color:#fff
    style AI3 fill:#E91E63,color:#fff
    style AI4 fill:#E91E63,color:#fff
```

---

**Legend:**
- 🟢 Green: Completed
- 🟠 Orange: In Progress
- 🔴 Red: Pending/TODO
- 🔵 Blue: External Service
- 🟣 Purple: AI/Smart Feature
