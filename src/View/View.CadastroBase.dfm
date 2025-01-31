object ViewCadastroBase: TViewCadastroBase
  Left = 0
  Top = 0
  Caption = 'Wk Technology'
  ClientHeight = 441
  ClientWidth = 624
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LabelTitulo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 21
    Align = alTop
    Caption = 'T'#237'tulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 45
  end
  object PageControlCadastro: TPageControl
    Left = 0
    Top = 27
    Width = 624
    Height = 414
    ActivePage = TabSheetConsulta
    Align = alClient
    TabOrder = 0
    object TabSheetConsulta: TTabSheet
      Caption = 'TabSheetConsulta'
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 610
        Height = 378
        Align = alClient
        ShowCaption = False
        TabOrder = 0
        object PanelCabecalho: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 602
          Height = 71
          Align = alTop
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 11
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object EditFiltroGrid: TEdit
            Left = 8
            Top = 33
            Width = 177
            Height = 23
            TabOrder = 0
            OnChange = EditFiltroGridChange
          end
        end
        object PanelContainer: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 81
          Width = 602
          Height = 293
          Align = alClient
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          object Panel1: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 596
            Height = 28
            Align = alTop
            ShowCaption = False
            TabOrder = 0
            object PanelNovo: TPanel
              Left = 515
              Top = 1
              Width = 80
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              Color = clBlue
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object SpeedButtonNovo: TSpeedButton
                Left = 0
                Top = 0
                Width = 80
                Height = 26
                Align = alClient
                Caption = 'Novo +'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                OnClick = SpeedButtonNovoClick
                ExplicitLeft = 8
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
            end
          end
          object DBGridConsulta: TDBGrid
            Left = 0
            Top = 34
            Width = 602
            Height = 259
            Align = alClient
            DataSource = DataSourceCadastro
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyUp = DBGridConsultaKeyUp
          end
        end
      end
    end
    object TabSheetCadastro: TTabSheet
      Caption = 'TabSheetCadastro'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 384
        Align = alClient
        Color = clGainsboro
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object PanelCadastroBotoes: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 347
          Width = 608
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          Color = clGainsboro
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object PanelBotaoSalvar: TPanel
            AlignWithMargins = True
            Left = 525
            Top = 3
            Width = 80
            Height = 27
            Align = alRight
            BevelOuter = bvNone
            Color = clGreen
            ParentBackground = False
            ShowCaption = False
            TabOrder = 0
            object SpeedButtonSalvar: TSpeedButton
              Left = 0
              Top = 0
              Width = 80
              Height = 27
              Align = alClient
              Caption = 'Salvar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButtonSalvarClick
              ExplicitLeft = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object PanelCancelar: TPanel
            AlignWithMargins = True
            Left = 439
            Top = 3
            Width = 80
            Height = 27
            Align = alRight
            BevelOuter = bvNone
            Color = clMaroon
            ParentBackground = False
            ShowCaption = False
            TabOrder = 1
            object SpeedButtonCancelar: TSpeedButton
              Left = 0
              Top = 0
              Width = 80
              Height = 27
              Align = alClient
              Caption = 'Cancelar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButtonCancelarClick
              ExplicitLeft = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object PanelCadastroCampos: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 608
          Height = 337
          Align = alClient
          BevelOuter = bvNone
          Color = clGainsboro
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
        end
      end
    end
  end
  object DataSourceCadastro: TDataSource
    DataSet = ClientDataSetCadastro
    Left = 280
    Top = 216
  end
  object ClientDataSetCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 216
  end
end
