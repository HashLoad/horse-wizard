unit Horse.Registration;

interface

uses
  ToolsApi,
  DesignIntf,
  System.SysUtils,
  Winapi.Windows,
  Horse.NewController.Wizard,
  Horse.NewProject.Wizard;

var
  bmSplashScreen: HBITMAP;

procedure register;

implementation

resourcestring
  resPackageName = 'Horse';
  resLicense = 'MIT License';

procedure Register;
begin
  ForceDemandLoadState(dlDisable);
  RegisterPackageWizard(THorseNewProjectWizard.New);
  RegisterPackageWizard(THorseNewControllerWizard.New);

end;

initialization
  bmSplashScreen := LoadBitmap(HInstance, 'HashloadSplash');
  (SplashScreenServices as IOTASplashScreenServices).AddPluginBitmap(resPackageName, bmSplashScreen);

end.
