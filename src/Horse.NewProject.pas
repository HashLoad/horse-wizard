unit Horse.NewProject;

interface

uses
  ToolsAPI,
  System.Generics.Collections,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  Horse.Boss.Initializer,
  Horse.Middlewares,
  Horse.Wizard.Utils,
  Horse.Wizard.Types,
  Horse.NewProject.Creator,
  Horse.NewProject.Creator.Apache,
  Horse.NewProject.Creator.Vcl,
  Horse.NewProject.Creator.WinSvc;

type THorseNewProject = class

  private
    class var FUseBoss: Boolean;
    class var FPort: Integer;
    class var FPlatform: THorsePlatform;
    class var FFramework: THorseFramework;
    class var FMiddlewares: TList<IHorseMiddleware>;

    class function GetCreator(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;
    class procedure AddMiddlewaresUses(AProject: IOTAProject; AMiddlewares: TList<IHorseMiddleware>);
    class procedure AddMiddlewares(AProject: IOTAProject; AMiddlewares: TList<IHorseMiddleware>);

  public
    class procedure Execute;

    class procedure Port(Value: Integer);
    class procedure UseBoss(Value: Boolean);
    class procedure &Platform(Value: THorsePlatform);
    class procedure Framework(Value: THorseFramework);
    class procedure Middlewares(Value: TList<IHorseMiddleware>);

end;

implementation

{ THorseNewProject }

class procedure THorseNewProject.AddMiddlewares(AProject: IOTAProject; AMiddlewares: TList<IHorseMiddleware>);
var
  unitText: TStringList;
  editView: IOTAEditView;
  i: Integer;
  linePosition: Integer;
  horseUse: string;
begin
  unitText := EditorAsStringList;
  try
    editView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for i := 0 to Pred(unitText.Count) do
    begin
      if unitText[i].Trim.StartsWith('THorse.Get') then
      begin
        linePosition := i + 1;
        Break;
      end;
    end;

    editView.Buffer.EditPosition.GotoLine(linePosition);
    editView.Buffer.EditPosition.InsertText(Chr(13));

    for i := 0 to Pred(AMiddlewares.Count) do
    begin
      editView.Buffer.EditPosition.GotoLine(linePosition);
      editView.Buffer.EditPosition.Tab(1);

      if i = 0 then
        editView.Buffer.EditPosition
          .InsertText( 'THorse' + Chr(13));

      horseUse := '.' + AMiddlewares[i].Declaration;
      horseUse := horseUse + IfThen(i = Pred(AMiddlewares.Count), ';', '') + Chr(13);

      editView.Buffer.EditPosition.Tab(1);
      editView.Buffer.EditPosition
          .InsertText( horseUse );

      if i = 0 then
        linePosition := linePosition + 2
      else
        linePosition := linePosition + 1;
    end;
  finally
    unitText.Free;
  end;
end;

class procedure THorseNewProject.AddMiddlewaresUses(AProject: IOTAProject; AMiddlewares: TList<IHorseMiddleware>);
var
  unitText: TStringList;
  editView: IOTAEditView;
  i: Integer;
  usesPosition: Integer;
begin
  unitText := EditorAsStringList;
  try
    editView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for i := 0 to Pred(unitText.Count) do
    begin
      if unitText[i].Trim.Equals('uses') then
      begin
        usesPosition := i + 2;
        Break;
      end;
    end;

    for i := 0 to Pred(AMiddlewares.Count) do
    begin
      editView.Buffer.EditPosition.GotoLine(usesPosition + 1);
      editView.Buffer.EditPosition.Tab(1);
      editView.Buffer.EditPosition
          .InsertText( AMiddlewares[i].&Uses + ',' + Chr(13));

      usesPosition := usesPosition + 1;
    end;
  finally
    unitText.Free;
  end;
end;

class procedure THorseNewProject.Execute;
var
  creator: IOTACreator;
  project: IOTAProject;
  boss: THorseBossInitializer;
begin
  creator := GetCreator(FPlatform, FFramework, FPort);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(creator);

  project := GetActiveProject;
  AddMiddlewares(project, FMiddlewares);
  AddMiddlewaresUses(project, FMiddlewares);

  if (project.Save(True, True)) and (FUseBoss) then
  begin
    boss := THorseBossInitializer.Create(project, FMiddlewares);
    try
      boss.Generate;
      boss.Wait;
    finally
      boss.Free;
    end;
  end;
end;

class procedure THorseNewProject.Framework(Value: THorseFramework);
begin
  FFramework := Value;
end;

class function THorseNewProject.GetCreator(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;
begin
  if AFramework = hfApache then
    result := THorseNewProjectCreatorApache.New(APlatform, AFramework, APort)
  else
  if AFramework = hfVcl then
    result := THorseNewProjectCreatorVcl.New(APlatform, AFramework, APort)
  else
  if AFramework = hfWinSvc then
    result := THorseNewProjectCreatorWinSvc.New(APlatform, AFramework, APort)
  else
    result := THorseNewProjectCreator.New(APlatform, AFramework, APort);
end;

class procedure THorseNewProject.Middlewares(Value: TList<IHorseMiddleware>);
begin
  FMiddlewares := Value;
end;

class procedure THorseNewProject.&Platform(Value: THorsePlatform);
begin
  FPlatform := Value;
end;

class procedure THorseNewProject.Port(Value: Integer);
begin
  FPort := Value;
end;

class procedure THorseNewProject.UseBoss(Value: Boolean);
begin
  FUseBoss := Value;
end;

end.
