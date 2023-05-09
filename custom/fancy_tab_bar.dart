class REstateDues extends StatefulHookConsumerWidget {
  const REstateDues({Key? key}) : super(key: key);

  @override
  ConsumerState<REstateDues> createState() => _REstateDuesState();
}

class _REstateDuesState extends ConsumerState<REstateDues> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      ref.read(residentEstateDuesNotifier.notifier).getResidentPaymentType();
    });
  }

  final _searchController = TextEditingController();

  List<AppTabModel> paymentTabList = [
    AppTabModel(title: "Pending Payments"),
    AppTabModel(title: "Confirmed Payment"),
    AppTabModel(title: "All Payments"),
  ];

  @override
  Widget build(BuildContext context) {
    final current = useState(0);
    final state = ref.watch(residentEstateDuesNotifier);

    return Scaffold(
      appBar: const ResAppBar(
        title: 'Estate Dues',
        action: [],
      ),
      backgroundColor: AppColors.whiteBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width(context) * 0.9,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  PaymentSearchWidget(searchController: _searchController),
                  const SizedBox(height: 28),
                  Center(
                    child: SizedBox(
                      height: 35,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => AppTabHeader(
                          fontSize: 11,
                          currentTab: current.value,
                          index: index,
                          item: paymentTabList[index],
                          onTap: () {
                            current.value = index;
                          },
                        ),
                        separatorBuilder: (context, item) =>
                            const SizedBox(width: 17),
                        itemCount: paymentTabList.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                ],
              ),
            ),
            const Divider(
              color: AppColors.black3,
              thickness: 1,
            ),
            state.loadstate == Loader.loading
                ? Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const AppLoader())
                : state.loadstate == Loader.error
                    ? const Center(
                        child: Text(
                            'The data couldn\'t be fetched from the backend'),
                      )
                    : Column(
                        children: [
                          if (current.value == 0)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final payment = state.ppayments![index];
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return payment.status.toLowerCase() ==
                                                  'paid'
                                              ? PaymentConfirmedDialogue(
                                                  payment: payment)
                                              : payment.status.toLowerCase() ==
                                                      'pending'
                                                  ? PaymentDialogue(
                                                      payment: payment)
                                                  : PaymentAwaitingDialogue(
                                                      payment: payment);
                                        });
                                  },
                                  child: PaymentTile(
                                    payment: payment,
                                  ),
                                );
                              },
                              itemCount: state.ppayments!.length,
                            ),
                          if (current.value == 1)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final payment = state.apayments![index];
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return payment.status.toLowerCase() ==
                                                  'paid'
                                              ? PaymentConfirmedDialogue(
                                                  payment: payment)
                                              : payment.status.toLowerCase() ==
                                                      'pending'
                                                  ? PaymentDialogue(
                                                      payment: payment)
                                                  : PaymentAwaitingDialogue(
                                                      payment: payment);
                                        });
                                  },
                                  child: PaymentTile(payment: payment),
                                );
                              },
                              itemCount: state.apayments!.length,
                            ),
                          if (current.value == 2)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final payment = state.payments![index];
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return payment.status.toLowerCase() ==
                                                  'paid'
                                              ? PaymentConfirmedDialogue(
                                                  payment: payment)
                                              : payment.status.toLowerCase() ==
                                                      'pending'
                                                  ? PaymentDialogue(
                                                      payment: payment)
                                                  : PaymentAwaitingDialogue(
                                                      payment: payment);
                                        });
                                  },
                                  child: PaymentTile(
                                    payment: payment,
                                  ),
                                );
                              },
                              itemCount: state.payments!.length,
                            )
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}

class AppTabModel {
  final String title;
  AppTabModel({required this.title});
}

class AppTabHeader extends StatelessWidget {
  const AppTabHeader({
    Key? key,
    required this.currentTab,
    required this.index,
    required this.item,
    this.onTap,
    this.width,
    this.fontSize,
  }) : super(key: key);
  final int currentTab;
  final int index;
  final AppTabModel item;
  final void Function()? onTap;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: currentTab == index ? AppColors.primaryColor : AppColors.white,
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w600,
            color: currentTab == index ? AppColors.white : null,
          ),
        ),
      ),
    );
  }
}
