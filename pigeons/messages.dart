import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    javaOptions: JavaOptions(
      className: 'InstallReferrerPigeon',
      package: 'fr.g123k.install_referrer',
    ),
    objcOptions: ObjcOptions(
      prefix: 'IR',
    ),
    dartOptions: DartOptions(
      isNullSafe: true,
    ),
    dartOut: './lib/src/private/pigeon_api.dart',
    objcHeaderOut: './ios/Classes/Messages.h',
    objcSourceOut: './ios/Classes/Messages.m',
    javaOut:
        './android/src/main/java/fr/g123k/install_referrer/InstallReferrerPigeon.java',
  ),
)
class IRInstallationReferer {
  final IRInstallationType? type;
  final IRInstallationPlatform? installationPlatform;
  final IRPlatform? platform;

  IRInstallationReferer({
    this.type,
    this.platform,
    this.installationPlatform,
  });
}

enum IRInstallationType {
  appStore,
  test,
  debug,
  unknown,
}

enum IRInstallationPlatform {
  appleAppStore,
  appleTestflight,
  googlePlay,
  amazonAppStore,
  samsungAppShop,
  manually,
  unknown,
}

enum IRPlatform {
  ios,
  android,
}

@HostApi()
abstract class InstallReferrerInternalAPI {
  @async
  IRInstallationReferer detectReferrer();
}
