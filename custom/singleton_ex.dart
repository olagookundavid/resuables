class FakeProductsRepository {
  FakeProductsRepository._();
  static FakeProductsRepository instance = FakeProductsRepository._();
}

//to call we call 
//final call = FakeProductRepository.instance.method();