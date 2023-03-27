
// BoxShadow
Container(
        alignment = Alignment.center,
        margin = const EdgeInsets.all(10),
        decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
            BoxShadow(
              color: AppColors.grey.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(-2, 3),
            ),
          ],
        ),)