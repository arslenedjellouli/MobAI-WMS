import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeDashboardPage extends StatefulWidget {
  const EmployeeDashboardPage({super.key});

  @override
  State<EmployeeDashboardPage> createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  int _activeTabIndex = 0;

  final _employeeName = 'Aris Kouache';
  final _employeeId = '213';
  final _isOnline = true;
  final _lastSync = 'now';

  _TaskCardData? _currentTask = const _TaskCardData(
    type: TaskType.receipt,
    code: 'BS321',
    floor: 'Ground (0)',
    zoneOrSlotLabel: 'Zone',
    zoneOrSlotValue: 'Receiving Bay 3',
    skuCount: 21,
  );

  late final List<_TaskCardData> _remainingTasks = [
    _TaskCardData(
      type: TaskType.receipt,
      code: 'EY120',
      floor: 'Ground (0)',
      zoneOrSlotLabel: 'Zone',
      zoneOrSlotValue: 'Receiving Bay 1',
      skuCount: 14,
    ),
    _TaskCardData(
      type: TaskType.storage,
      code: 'AS409',
      floor: 'One (1)',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'D25',
      skuCount: 14,
    ),
    _TaskCardData(
      type: TaskType.picking,
      code: 'PO089',
      floor: 'One (1)',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'D25',
      skuCount: 14,
    ),
    _TaskCardData(
      type: TaskType.delivery,
      code: 'HF438',
      floor: 'One (1)',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'D25',
      skuCount: 14,
    ),
  ];

  final List<_TaskCardData> _completedTasks = [
    const _TaskCardData(
      type: TaskType.storage,
      code: 'AS120',
      floor: 'One (1)',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'C11',
      skuCount: 9,
    ),
    const _TaskCardData(
      type: TaskType.picking,
      code: 'PK210',
      floor: 'Ground (0)',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'A02',
      skuCount: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final stats = _buildShiftStats();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(textTheme),
              const SizedBox(height: 20),
              Text(
                "Today's Shift",
                style: GoogleFonts.manrope(
                  textStyle: textTheme.titleMedium,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildShiftTabs(textTheme, stats),
              const SizedBox(height: 20),
              if (_activeTabIndex == 0)
                _buildCurrentTask(textTheme)
              else if (_activeTabIndex == 1)
                _buildCompletedTasks(textTheme)
              else
                _buildRemainingTasks(textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $_employeeName,',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.titleLarge,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Employee #$_employeeId',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isOnline
                        ? const Color(0xFF22C55E)
                        : const Color(0xFFEF4444),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Last sync: $_lastSync',
              style: GoogleFonts.manrope(
                textStyle: textTheme.bodySmall,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<_ShiftStat> _buildShiftStats() {
    final currentCount = _currentTask == null ? 0 : 1;
    final totalTasks = _remainingTasks.length + _completedTasks.length + currentCount;
    return [
      _ShiftStat(label: 'Tasks', value: totalTasks),
      _ShiftStat(label: 'Completed', value: _completedTasks.length),
      _ShiftStat(label: 'Remaining', value: _remainingTasks.length),
    ];
  }

  Widget _buildShiftTabs(TextTheme textTheme, List<_ShiftStat> stats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stats.length, (index) {
        final stat = stats[index];
        final isActive = _activeTabIndex == index;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == stats.length - 1 ? 0 : 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() => _activeTabIndex = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        isActive ? const Color(0xFF3C91CC) : Colors.transparent,
                    width: 1.4,
                  ),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  children: [
                    Text(
                      '${stat.value}',
                      style: GoogleFonts.manrope(
                        textStyle: textTheme.titleLarge,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      stat.label,
                      style: GoogleFonts.manrope(
                        textStyle: textTheme.bodySmall,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCurrentTask(TextTheme textTheme) {
    final currentTask = _currentTask;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Task',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleMedium,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        if (currentTask == null)
          _buildEmptyState(
            textTheme,
            'No task in progress. Start a task from Remaining.',
          )
        else
          _TaskCard(
            data: currentTask,
            showDualActions: true,
            onValidate: _completeCurrentTask,
            onReport: () => _showReportSheet(currentTask),
          ),
      ],
    );
  }

  Widget _buildRemainingTasks(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Remaining Tasks',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleMedium,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        if (_remainingTasks.isEmpty)
          _buildEmptyState(textTheme, 'No remaining tasks.')
        else
          ..._remainingTasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TaskCard(
                data: task,
                onStart: () => _handleStartTask(task),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCompletedTasks(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completed Tasks',
            style: GoogleFonts.manrope(
              textStyle: textTheme.titleMedium,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          if (_completedTasks.isEmpty)
            _buildEmptyState(textTheme, 'No completed tasks yet.')
          else
            ..._completedTasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _TaskCard(
                  data: task,
                  showCompleted: true,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(TextTheme textTheme, String message) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF94A3B8)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.manrope(
                textStyle: textTheme.bodyMedium,
                color: const Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleStartTask(_TaskCardData task) {
    final shouldShowSheet = task.type != TaskType.receipt;
    _startTask(task);

    if (shouldShowSheet) {
      _showTaskActionSheet(task);
    }
  }

  void _startTask(_TaskCardData task) {
    setState(() {
      _remainingTasks.remove(task);
      if (_currentTask != null) {
        _remainingTasks.insert(0, _currentTask!);
      }
      _currentTask = task;
    });
  }

  void _completeCurrentTask() {
    if (_currentTask == null) {
      return;
    }

    setState(() {
      _completedTasks.insert(0, _currentTask!);
      _currentTask = null;
    });
  }

  Future<void> _showTaskActionSheet(_TaskCardData task) async {
    final textTheme = Theme.of(context).textTheme;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _showReportSheet(task);
                              },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDC2626),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.report_outlined, size: 18),
                            label: Text(
                              'Report',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _completeCurrentTask();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3C91CC),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.check_circle_outline, size: 18),
                            label: Text(
                              'Validate',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showReportSheet(_TaskCardData task) async {
    final textTheme = Theme.of(context).textTheme;
    final options = _reportOptionsFor(task.type);
    final selected = <String>{};
    final sheetSize = _reportSheetSize(context, options.length);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: sheetSize,
          minChildSize: sheetSize,
          maxChildSize: sheetSize,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Report Issue',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.titleLarge,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${task.type.label} Order - ${task.code}',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setSheetState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              for (final option in options)
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      setSheetState(() {
                                        if (selected.contains(option)) {
                                          selected.remove(option);
                                        } else {
                                          selected.add(option);
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 26,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: selected.contains(option)
                                                ? const Color(0xFFDC2626)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(
                                              color: const Color(0xFFCBD5E1),
                                              width: 2,
                                            ),
                                          ),
                                          child: selected.contains(option)
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            option,
                                            style: GoogleFonts.manrope(
                                              textStyle: textTheme.bodyLarge,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF334155),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDC2626),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.report_outlined, size: 18),
                            label: Text(
                              'Send Report',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFFEE2E2),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFDC2626),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  double _reportSheetSize(BuildContext context, int optionCount) {
    final screenHeight = MediaQuery.of(context).size.height;
    const baseHeight = 300.0;
    const optionRowHeight = 44.0;
    final targetHeight = baseHeight + (optionRowHeight * optionCount);
    final fraction = targetHeight / screenHeight;
    return fraction.clamp(0.45, 0.9);
  }

  List<String> _reportOptionsFor(TaskType type) {
    switch (type) {
      case TaskType.receipt:
        return [
          'Damaged product',
          'Wrong product',
          'Extra items',
          'Missing items',
          'Pallet unstable / dangerous',
        ];
      case TaskType.delivery:
        return [
          'Truck not ready',
          'Missing items',
          'Damaged during transport',
          'Inside warehouse',
        ];
      case TaskType.picking:
        return [
          'Quantity insufficient',
          'Item damaged',
          'Cannot reach shelf',
          'Product not in slot',
        ];
      case TaskType.storage:
        return [
          'Slot physically inaccessible',
          'Quantity already stored',
          'Slot already occupied',
          'Chariot/cart problem',
          'Elevator not working',
          'Path blocked',
        ];
    }
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.data,
    this.showDualActions = false,
    this.showCompleted = false,
    this.onStart,
    this.onValidate,
    this.onReport,
  });

  final _TaskCardData data;
  final bool showDualActions;
  final bool showCompleted;
  final VoidCallback? onStart;
  final VoidCallback? onValidate;
  final VoidCallback? onReport;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final typeColor = data.type.color;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    data.type.icon,
                    size: 16,
                    color: typeColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${data.type.label} Order - ${data.code}',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.bodyLarge,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(label: 'Floor', value: data.floor),
                      const SizedBox(height: 8),
                      _InfoRow(
                        label: data.zoneOrSlotLabel,
                        value: data.zoneOrSlotValue,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.inventory_2_outlined,
                            size: 18,
                            color: Color(0xFF475569),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${data.skuCount} SKUs',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    data.type.icon,
                    size: 40,
                    color: typeColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: showDualActions
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onReport,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC2626),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.report_outlined, size: 18),
                          label: Text(
                            'Report',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onValidate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3C91CC),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.check_circle_outline, size: 18),
                          label: Text(
                            'Validate',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: showCompleted ? null : onStart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            showCompleted ? const Color(0xFFE2E8F0) : typeColor,
                        foregroundColor:
                            showCompleted ? const Color(0xFF64748B) : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            showCompleted ? 'Completed' : 'Start',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyLarge,
                              fontWeight: FontWeight.w700,
                              color: showCompleted
                                  ? const Color(0xFF64748B)
                                  : Colors.white,
                            ),
                          ),
                          if (!showCompleted) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_rounded, size: 18),
                          ],
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        style: GoogleFonts.manrope(
          textStyle: textTheme.bodyMedium,
          color: const Color(0xFF0F172A),
        ),
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ShiftStat {
  const _ShiftStat({required this.label, required this.value});

  final String label;
  final int value;
}

class _TaskCardData {
  const _TaskCardData({
    required this.type,
    required this.code,
    required this.floor,
    required this.zoneOrSlotLabel,
    required this.zoneOrSlotValue,
    required this.skuCount,
  });

  final TaskType type;
  final String code;
  final String floor;
  final String zoneOrSlotLabel;
  final String zoneOrSlotValue;
  final int skuCount;
}

enum TaskType { receipt, storage, picking, delivery }

extension TaskTypeUI on TaskType {
  String get label {
    switch (this) {
      case TaskType.receipt:
        return 'Receipt';
      case TaskType.storage:
        return 'Storage';
      case TaskType.picking:
        return 'Picking';
      case TaskType.delivery:
        return 'Delivery';
    }
  }

  Color get color {
    switch (this) {
      case TaskType.receipt:
        return const Color(0xFF3C91CC);
      case TaskType.storage:
        return const Color(0xFF7B67BF);
      case TaskType.picking:
        return const Color(0xFFFE8C21);
      case TaskType.delivery:
        return const Color(0xFF71B643);
    }
  }

  IconData get icon {
    switch (this) {
      case TaskType.receipt:
        return Icons.receipt_long;
      case TaskType.storage:
        return Icons.inventory_2;
      case TaskType.picking:
        return Icons.checklist;
      case TaskType.delivery:
        return Icons.local_shipping;
    }
  }
}
