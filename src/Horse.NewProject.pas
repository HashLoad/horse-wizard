unit Horse.NewProject;

interface

uses ToolsAPI, System.Generics.Collections, System.SysUtils, System.StrUtils, System.Classes, Horse.Boss.Initializer,
  Horse.Middlewares, Horse.Wizard.Utils, Horse.Wizard.Types, Horse.NewProject.Creator, Horse.NewProject.Creator.Apache,
  Horse.NewProject.Creator.Vcl, Horse.NewProject.Creator.WinSvc, System.Math;

type
  THorseNewProject = class

  private
    class var FUseBoss: Boolean;
    class var FPort: Integer;
    class var FPlatform: THorsePlatform;
    class var FFramework: THorseFramework;
    class var FMiddlewares: TList<IHorseMiddleware>;
    class function GetCreator(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer): IOTACreator;
    class procedure AddMiddlewaresUses(const AProject: IOTAProject; const AMiddlewares: TList<IHorseMiddleware>);
    class procedure AddMiddlewares(const AProject: IOTAProject; const AMiddlewares: TList<IHorseMiddleware>);
  public
    class procedure Execute;
    class procedure Port(const AValue: Integer);
    class procedure UseBoss(const AValue: Boolean);
    class procedure &Platform(const AValue: THorsePlatform);
    class procedure Framework(const AValue: THorseFramework);
    class procedure Middlewares(const AValue: TList<IHorseMiddleware>);
  end;

implementation

{ THorseNewProject }

class procedure THorseNewProject.AddMiddlewares(const AProject: IOTAProject; const AMiddlewares: TList<IHorseMiddleware>);
var
  LUnitText: TStringList;
  LEditView: IOTAEditView;
  I: Integer;
  LLinePosition: Integer;
  LHorseUse: string;
begin
  LLinePosition := 0;
  LUnitText := EditorAsStringList;
  try
    LEditView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for I := 0 to Pred(LUnitText.Count) do
    begin
      if LUnitText[I].Trim.StartsWith('THorse.Get') then
      begin
        LLinePosition := I + 1;
        Break;
      end;
    end;

    LEditView.Buffer.EditPosition.GotoLine(LLinePosition);
    LEditView.Buffer.EditPosition.InsertText(Chr(13));

    for I := 0 to Pred(AMiddlewares.Count) do
    begin
      LEditView.Buffer.EditPosition.GotoLine(LLinePosition);
      LEditView.Buffer.EditPosition.Tab(1);

      if I = 0 then
        LEditView.Buffer.EditPosition.InsertText('THorse' + Chr(13));

      LHorseUse := '.' + AMiddlewares[I].Declaration;
      LHorseUse := LHorseUse + IfThen(I = Pred(AMiddlewares.Count), ';', '') + Chr(13);

      LEditView.Buffer.EditPosition.Tab(1);
      LEditView.Buffer.EditPosition.InsertText(LHorseUse);
      LLinePosition := LLinePosition + IfThen(I = 0, 2, 1);
    end;
  finally
    LUnitText.Free;
  end;
end;

class procedure THorseNewProject.AddMiddlewaresUses(const AProject: IOTAProject; const AMiddlewares: TList<IHorseMiddleware>);
var
  LUnitText: TStringList;
  LEditView: IOTAEditView;
  I: Integer;
  LUsesPosition: Integer;
begin
  LUsesPosition := 0;
  LUnitText := EditorAsStringList;
  try
    LEditView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for I := 0 to Pred(LUnitText.Count) do
    begin
      if LUnitText[I].Trim.Equals('uses') then
      begin
        LUsesPosition := I + 2;
        Break;
      end;
    end;

    for I := 0 to Pred(AMiddlewares.Count) do
    begin
      LEditView.Buffer.EditPosition.GotoLine(LUsesPosition + 1);
      LEditView.Buffer.EditPosition.Tab(1);
      LEditView.Buffer.EditPosition.InsertText(AMiddlewares[I].&Uses + ',' + Chr(13));
      LUsesPosition := LUsesPosition + 1;
    end;
  finally
    LUnitText.Free;
  end;
end;

class procedure THorseNewProject.Execute;
var
  LCreator: IOTACreator;
  LProject: IOTAProject;
  LBoss: THorseBossInitializer;
begin
  LCreator := GetCreator(FPlatform, FFramework, FPort);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(LCreator);

  LProject := GetActiveProject;
  AddMiddlewares(LProject, FMiddlewares);
  AddMiddlewaresUses(LProject, FMiddlewares);

  if (LProject.Save(True, True)) and (FUseBoss) then
  begin
    LBoss := THorseBossInitializer.Create(LProject, FMiddlewares);
    try
      LBoss.Generate;
      LBoss.Wait;
    finally
      LBoss.Free;
    end;
  end;
end;

class procedure THorseNewProject.Framework(const AValue: THorseFramework);
begin
  FFramework := AValue;
end;

class function THorseNewProject.GetCreator(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer): IOTACreator;
begin
  if AFramework = hfApache then
    Result := THorseNewProjectCreatorApache.New(APlatform, AFramework, APort)
  else if AFramework = hfVcl then
    Result := THorseNewProjectCreatorVcl.New(APlatform, AFramework, APort)
  else if AFramework = hfWinSvc then
    Result := THorseNewProjectCreatorWinSvc.New(APlatform, AFramework, APort)
  else
    Result := THorseNewProjectCreator.New(APlatform, AFramework, APort);
end;

class procedure THorseNewProject.Middlewares(const AValue: TList<IHorseMiddleware>);
begin
  FMiddlewares := AValue;
end;

class procedure THorseNewProject.&Platform(const AValue: THorsePlatform);
begin
  FPlatform := AValue;
end;

class procedure THorseNewProject.Port(const AValue: Integer);
begin
  FPort := AValue;
end;

class procedure THorseNewProject.UseBoss(const AValue: Boolean);
begin
  FUseBoss := AValue;
end;

end.
