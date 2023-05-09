DatePicker widget
class DatePickWidget extends StatelessWidget {
  const DatePickWidget({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.grey,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.calendar_today_outlined)
          ],
        ),
      ),
    );
  }
}

                      DatePickWidget(
                        onTap: () {
                          showDatePicker(
                            builder: (context, child) {
                              return DatePickerTheme(
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: startDate != null
                                ? startDate!.add(const Duration(days: 1))
                                : DateTime.now().add(const Duration(days: 1)),
                            firstDate: startDate != null
                                ? startDate!.add(const Duration(days: 1))
                                : DateTime.now().add(const Duration(days: 1)),
                            lastDate: DateTime.now().add(
                              const Duration(days: 3650),
                            ),
                          ).then((value) {
                            setState(() {});
                            if (value != null) {
                              endDate = value;
                            }
                          });
                        },
                        title: endDate != null
                            ? DateFormatter.format(endDate!)!
                            : "End date",
                      ),

class DateFormatter {
  static String? format(DateTime date) {
    var newDate = DateFormat("yyyy-MM-dd").format(date);
    return newDate;
  }
}

