unit Horse.Registration;

interface

uses
  ToolsApi,
  DesignIntf,
  System.SysUtils,
  Winapi.Windows,
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
end;

initialization
  bmSplashScreen := LoadBitmap(HInstance, 'HashloadSplash');
  (SplashScreenServices as IOTASplashScreenServices).AddPluginBitmap(resPackageName, bmSplashScreen);


end.
