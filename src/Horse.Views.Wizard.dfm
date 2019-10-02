object FrmNewProject: TFrmNewProject
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New project'
  ClientHeight = 527
  ClientWidth = 441
  Color = clBtnFace
  Constraints.MinHeight = 145
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 527
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      441
      527)
    object imgHeader: TImage
      Left = 22
      Top = 12
      Width = 398
      Height = 134
      Anchors = [akLeft, akTop, akRight]
      AutoSize = True
    end
    object Image1: TImage
      AlignWithMargins = True
      Left = 1
      Top = 416
      Width = 439
      Height = 40
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 70
      Align = alBottom
      AutoSize = True
      Center = True
      ExplicitTop = 486
      ExplicitWidth = 339
    end
    object lblMiddlewares: TLabel
      Left = 22
      Top = 211
      Width = 67
      Height = 13
      Caption = 'Middlewares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object chkAddToProjectGroup: TCheckBox
      Left = 22
      Top = 174
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Add to existing project group'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object chkJhonson: TCheckBox
      Left = 22
      Top = 230
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'jhonson - JSON parser'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object chkHorseCORS: TCheckBox
      Left = 22
      Top = 253
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'horse-cors - Inject CORS headers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chkHorseOctetStream: TCheckBox
      Left = 22
      Top = 276
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'horse-octet-stream - Support stream'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object chkHorseJWT: TCheckBox
      Left = 22
      Top = 299
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'horse-jwt - JSON Web Token'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object chkHorseBasicAuth: TCheckBox
      Left = 22
      Top = 322
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'horse-basic-auth - Basic authentication'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object chkHorseCompression: TCheckBox
      Left = 22
      Top = 345
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'horse-compression - Compression'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object chkHandleException: TCheckBox
      Left = 22
      Top = 368
      Width = 230
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'handle-exception - Handler exceptions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object Button1: TButton
      Left = 220
      Top = 471
      Width = 109
      Height = 37
      Caption = 'CANCEL'
      ModalResult = 2
      TabOrder = 8
    end
    object Button2: TButton
      Left = 105
      Top = 471
      Width = 109
      Height = 37
      Caption = 'DONE'
      Default = True
      ModalResult = 1
      TabOrder = 9
    end
  end
end
