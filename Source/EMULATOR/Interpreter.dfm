object ScriptFrm: TScriptFrm
  Left = 440
  Top = 313
  HelpContext = 999
  Caption = 'Script program'
  ClientHeight = 336
  ClientWidth = 462
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object SourceEditor: TJvHLEditor
    Left = 0
    Top = 20
    Width = 462
    Height = 280
    Cursor = crIBeam
    Lines.Strings = (
      '//'
      '// Script example. Adapt it to your needs.'
      '//'
      ''
      'unit Script;'
      ''
      '// Main procedure that will be called in first'
      'function Main: boolean;'
      'var'
      '  Pump: boolean;'
      '  Cycle: integer;'
      'begin'
      '  // 0 = Full speed for the script'
      '  ScriptSpeed := 1;'
      ''
      '  while not Terminated do'
      '    begin'
      '      // Bit number 2 Run/stop script'
      '      while not GetBitValue(2) and not Terminated do'
      '        begin'
      
        '          Pump := GetBitValue(0);   // Get bit number 0 => run p' +
        'ump from SCADA'
      
        '          SetBitValue(1, Pump);     // Set bit number 1 => pump ' +
        'running contact'
      ''
      '          Cycle := GetRegisterValue(0);'
      '          Cycle := Cycle + 1;'
      '          SetRegisterValue(0, Cycle);'
      '        end;'
      '    end;'
      '  Result := True;'
      'end;'
      ''
      'end.')
    GutterWidth = 30
    RightMarginVisible = False
    RightMargin = 10
    Completion.ItemHeight = 13
    Completion.CRLF = '/n'
    Completion.Separator = '='
    TabStops = '3 5'
    BracketHighlighting.StringEscape = #39#39
    OnChangeStatus = SourceEditorChangeStatus
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'JetBrains Mono'
    Font.Style = []
    Colors.Comment.Style = [fsItalic]
    Colors.Comment.ForeColor = clNavy
    Colors.Comment.BackColor = clWindow
    Colors.Number.ForeColor = clNavy
    Colors.Number.BackColor = clWindow
    Colors.Strings.ForeColor = clBlue
    Colors.Strings.BackColor = clWindow
    Colors.Symbol.ForeColor = clBlack
    Colors.Symbol.BackColor = clWindow
    Colors.Reserved.Style = [fsBold]
    Colors.Reserved.ForeColor = clBlack
    Colors.Reserved.BackColor = clWindow
    Colors.Identifier.ForeColor = clBlack
    Colors.Identifier.BackColor = clWindow
    Colors.Preproc.ForeColor = clGreen
    Colors.Preproc.BackColor = clWindow
    Colors.FunctionCall.ForeColor = clWindowText
    Colors.FunctionCall.BackColor = clWindow
    Colors.Declaration.ForeColor = clWindowText
    Colors.Declaration.BackColor = clWindow
    Colors.Statement.Style = [fsBold]
    Colors.Statement.ForeColor = clWindowText
    Colors.Statement.BackColor = clWindow
    Colors.PlainText.ForeColor = clWindowText
    Colors.PlainText.BackColor = clWindow
    ExplicitHeight = 261
  end
  object BottomPanel: TJvPanel
    Left = 0
    Top = 300
    Width = 462
    Height = 36
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      462
      36)
    object CaretLabel: TLabel
      Left = 394
      Top = 13
      Width = 56
      Height = 15
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'CaretLabel'
    end
    object SaveBtn: TBitBtn
      Left = 141
      Top = 5
      Width = 156
      Height = 25
      Anchors = [akBottom]
      Caption = 'Ok'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = CompileClick
    end
    object ScriptEnableCB: TCheckBox
      Left = 13
      Top = 10
      Width = 124
      Height = 16
      Caption = 'Enable'
      TabOrder = 1
    end
  end
  object StatusPanel: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 2
  end
  object InterpreterProgram: TJvInterpreterFm
    OnGetValue = InterpreterProgramGetValue
    OnSetValue = InterpreterProgramSetValue
    OnStatement = InterpreterProgramStatement
    Left = 260
    Top = 89
  end
  object FormStorage: TJvFormStorage
    AppStorage = MainFrm.AppIniFile
    AppStoragePath = 'ScriptFrm\'
    Options = [fpSize, fpLocation]
    StoredValues = <>
    Left = 308
    Top = 88
  end
end
