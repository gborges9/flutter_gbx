abstract class BaseUseCase<Return, Param> {
  const BaseUseCase();

  Return call({required Param params});
}
