unit Horse.Registration;

interface

uses ToolsApi, DesignIntf, System.SysUtils, Horse.NewController.Wizard, Horse.NewController.Binding,
  Horse.NewProject.Wizard;

procedure register;

implementation

procedure Register;
begin
  ForceDemandLoadState(dlDisable);
  RegisterPackageWizard(THorseNewProjectWizard.New);
  RegisterPackageWizard(THorseNewControllerWizard.New);
  RegisterNewControllerBinding;
end;

end.
