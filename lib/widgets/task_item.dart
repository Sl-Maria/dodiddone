import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;
  final Function? onEdit; // Функция для редактирования
  final Function? onDelete; // Функция для удаления

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.deadline,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the deadline using intl
    String formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);

    // Calculate the urgency level
    Duration timeUntilDeadline = deadline.difference(DateTime.now());
    int urgencyLevel = 3; // Default to low urgency
    if (timeUntilDeadline.inDays <= 1) {
      urgencyLevel = 1; // High urgency
    } else if (timeUntilDeadline.inDays <= 2) {
      urgencyLevel = 2; // Medium urgency
    }

    // Define gradients based on urgency level
    LinearGradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.greenAccent, Colors.white], // Default to green-white
    );
    if (urgencyLevel == 1) {
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.red, Colors.white],
      );
    } else if (urgencyLevel == 2) {
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.amber, Colors.white],
      );
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Make text color black for better contrast
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onEdit as void Function()?,
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: onDelete as void Function()?,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Дедлайн: $formattedDeadline', // Use the formatted deadline
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
