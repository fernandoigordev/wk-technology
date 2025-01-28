inherited ViewPedidoVenda: TViewPedidoVenda
  StyleElements = [seFont, seClient, seBorder]
  ExplicitTop = -29
  TextHeight = 15
  inherited LabelTitulo: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited PageControlCadastro: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
      inherited Panel3: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitHeight = 378
        inherited PanelCabecalho: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 4
          ExplicitTop = 4
          ExplicitWidth = 602
          inherited Label1: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited EditFiltroGrid: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited PanelFiltrar: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited PanelContainer: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 4
          ExplicitTop = 81
          ExplicitWidth = 602
          ExplicitHeight = 293
          inherited Panel1: TPanel
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 596
            inherited PanelNovo: TPanel
              StyleElements = [seFont, seClient, seBorder]
              ExplicitLeft = 515
              ExplicitTop = 1
              ExplicitHeight = 26
            end
          end
        end
      end
    end
    inherited TabSheetCadastro: TTabSheet
      inherited Panel2: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 616
        ExplicitHeight = 384
        inherited PanelCadastroBotoes: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 4
          ExplicitTop = 347
          ExplicitWidth = 608
          inherited PanelBotaoSalvar: TPanel
            StyleElements = [seFont, seClient, seBorder]
            ExplicitLeft = 525
          end
          inherited PanelCancelar: TPanel
            StyleElements = [seFont, seClient, seBorder]
            ExplicitLeft = 439
          end
        end
        inherited PanelCadastroCampos: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 4
          ExplicitTop = 4
          ExplicitWidth = 608
          ExplicitHeight = 337
          object GroupBoxDadosPedido: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 602
            Height = 105
            Align = alTop
            Caption = 'Dados do pedido'
            TabOrder = 0
            object LabelCodigoPedido: TLabel
              Left = 16
              Top = 27
              Width = 39
              Height = 15
              Caption = 'C'#243'digo'
            end
            object Label2: TLabel
              Left = 111
              Top = 27
              Width = 37
              Height = 15
              Caption = 'Cliente'
            end
            object Label3: TLabel
              Left = 410
              Top = 27
              Width = 86
              Height = 15
              Caption = 'Data de emiss'#227'o'
            end
            object DBEdit1: TDBEdit
              Left = 16
              Top = 48
              Width = 86
              Height = 23
              TabOrder = 0
            end
            object DBEditCodCliente: TDBEdit
              Left = 111
              Top = 48
              Width = 58
              Height = 23
              TabOrder = 1
            end
            object DBEdit2: TDBEdit
              Left = 175
              Top = 48
              Width = 226
              Height = 23
              Enabled = False
              TabOrder = 2
            end
            object DBEdit3: TDBEdit
              Left = 410
              Top = 48
              Width = 86
              Height = 23
              TabOrder = 3
            end
          end
          object GroupBoxItensPedido: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 114
            Width = 602
            Height = 220
            Align = alClient
            Caption = 'Itens do pedido'
            TabOrder = 1
            object PanelTopAddItem: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 592
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = clGainsboro
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object PanelAdicionarItem: TPanel
                AlignWithMargins = True
                Left = 509
                Top = 3
                Width = 80
                Height = 27
                Align = alRight
                BevelOuter = bvNone
                Color = clBlue
                ParentBackground = False
                ShowCaption = False
                TabOrder = 0
                object SpeedButtonAdicionarItem: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Align = alClient
                  Caption = 'Adicionar +'
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
            end
            object DBGridItemPedido: TDBGrid
              Left = 2
              Top = 56
              Width = 598
              Height = 123
              Align = alClient
              BorderStyle = bsNone
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
            object PanelBottomAddItem: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 182
              Width = 592
              Height = 33
              Align = alBottom
              BevelOuter = bvNone
              Color = clGainsboro
              ParentBackground = False
              ShowCaption = False
              TabOrder = 2
              object LabelTotalPedido: TLabel
                Left = 530
                Top = 0
                Width = 62
                Height = 33
                Align = alRight
                Alignment = taRightJustify
                Caption = '7.500,00'
                Color = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 21
              end
              object Label4: TLabel
                Left = 465
                Top = 0
                Width = 65
                Height = 33
                Align = alRight
                Alignment = taRightJustify
                Caption = 'Total: R$'
                Color = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                ExplicitLeft = 461
                ExplicitHeight = 21
              end
            end
          end
        end
      end
    end
  end
  inherited DataSourceCadastro: TDataSource
    Left = 344
    Top = 400
  end
  inherited ClientDataSetCadastro: TClientDataSet
    Left = 160
    Top = 400
  end
end
