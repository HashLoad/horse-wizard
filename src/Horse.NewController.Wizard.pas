unit Horse.NewController.Wizard;

interface

uses
  Horse.NewController,
  System.SysUtils,
  System.Classes,
  ToolsAPI,
  Winapi.Windows;

type THorseNewControllerWizard = class(TNotifierObject, IOTAWizard,
                                                        IOTAProjectWizard,
                                                        IOTARepositoryWizard)

  protected
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;

    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;

  public
    class function New: IOTAWizard;
end;

implementation

{ THorseNewControllerWizard }

procedure THorseNewControllerWizard.Execute;
begin
  THorseNewController.CreateController;
end;

function THorseNewControllerWizard.GetAuthor: string;
begin
  result := 'Horse - https://github.com/HashLoad/horse';
end;

function THorseNewControllerWizard.GetComment: string;
begin
  result := 'Create a new Horse Controller';
end;

function THorseNewControllerWizard.GetGlyph: Cardinal;
begin
  result := LoadIcon(HInstance, 'HashloadIcon');
end;

function THorseNewControllerWizard.GetIDString: string;
begin
  result := Self.ClassName;
end;

function THorseNewControllerWizard.GetName: string;
begin
  result := 'Horse Controller';
end;

function THorseNewControllerWizard.GetPage: string;
begin
  result := 'Horse';
end;

function THorseNewControllerWizard.GetState: TWizardState;
begin
  result := [wsEnabled];
end;

class function THorseNewControllerWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
