object FProspects: TFProspects
  Left = 0
  Top = 0
  Caption = 'Pedido de vendas'
  ClientHeight = 461
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 461
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -1
    object pnlPedido: TPanel
      Left = 1
      Top = 47
      Width = 946
      Height = 50
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 36
        Height = 13
        Caption = 'Pedido:'
      end
      object Label2: TLabel
        Left = 16
        Top = 31
        Width = 37
        Height = 13
        Caption = 'Cliente:'
      end
      object dbednumero: TDBEdit
        Left = 58
        Top = 1
        Width = 121
        Height = 21
        DataField = 'numero'
        DataSource = dsPedido
        Enabled = False
        TabOrder = 0
      end
      object dbedtcodigocliente: TDBEdit
        Left = 59
        Top = 28
        Width = 121
        Height = 21
        DataField = 'codigocliente'
        DataSource = dsPedido
        TabOrder = 1
      end
      object btnpesquisacliente: TButton
        Left = 187
        Top = 26
        Width = 21
        Height = 22
        Hint = 'Retorno Cliente'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnpesquisaclienteClick
      end
      object DBEdit3: TDBEdit
        Left = 214
        Top = 28
        Width = 291
        Height = 21
        CharCase = ecUpperCase
        DataField = 'nome'
        DataSource = dsPedido
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 217
        Top = 3
        Width = 121
        Height = 21
        DataField = 'dataemissao'
        DataSource = dsPedido
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 511
        Top = 28
        Width = 291
        Height = 21
        CharCase = ecUpperCase
        DataField = 'endereco'
        DataSource = dsPedido
        ReadOnly = True
        TabOrder = 5
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 946
      Height = 46
      Align = alTop
      AutoSize = True
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 1
      ExplicitTop = -5
      object btn_novo: TButton
        Left = 121
        Top = 1
        Width = 60
        Height = 44
        Align = alLeft
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btn_novoClick
        ExplicitTop = 2
        ExplicitHeight = 43
      end
      object btncancelar: TButton
        Left = 361
        Top = 1
        Width = 60
        Height = 44
        Align = alLeft
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 1
        OnClick = btncancelarClick
        ExplicitLeft = 427
        ExplicitTop = -4
      end
      object btngravar: TButton
        Left = 301
        Top = 1
        Width = 60
        Height = 44
        Align = alLeft
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = btngravarClick
        ExplicitTop = 2
        ExplicitHeight = 43
      end
      object btnEditar: TButton
        Left = 181
        Top = 1
        Width = 60
        Height = 44
        Align = alLeft
        Caption = 'Editar'
        TabOrder = 3
        OnClick = btnEditarClick
        ExplicitTop = 2
        ExplicitHeight = 43
      end
      object btnExcluir: TButton
        Left = 241
        Top = 1
        Width = 60
        Height = 44
        Align = alLeft
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
        ExplicitTop = 2
        ExplicitHeight = 43
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 120
        Height = 44
        DataSource = dsPedido
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alLeft
        TabOrder = 5
        ExplicitTop = 2
        ExplicitHeight = 43
      end
      object btnPesquisa: TButton
        Left = 421
        Top = 1
        Width = 60
        Height = 44
        Hint = 'busca de pedidos,'
        Align = alLeft
        Caption = 'Buscar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnPesquisaClick
        ExplicitLeft = 416
        ExplicitTop = -4
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 97
      Width = 946
      Height = 29
      Align = alTop
      Caption = 'Pedido Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitTop = 128
    end
    object NTB_pedidoproduto: TNotebook
      Left = 1
      Top = 126
      Width = 946
      Height = 305
      Align = alClient
      TabOrder = 3
      ExplicitTop = 131
      ExplicitHeight = 306
      object TPage
        Left = 0
        Top = 0
        Caption = 'grid'
        ExplicitWidth = 150
        ExplicitHeight = 150
        object dbpedidoproduto: TDBGrid
          Left = 0
          Top = 0
          Width = 946
          Height = 305
          Align = alClient
          DataSource = dsItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = dbpedidoprodutoKeyDown
        end
        object pnlPesquisaPedido: TPanel
          Left = 301
          Top = 15
          Width = 286
          Height = 109
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          object Label3: TLabel
            Left = 11
            Top = 32
            Width = 37
            Height = 14
            Caption = 'Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnConfirmaPesquisa: TButton
            Left = 54
            Top = 70
            Width = 75
            Height = 25
            Caption = 'Confirma'
            TabOrder = 0
            OnClick = btnConfirmaPesquisaClick
          end
          object btnCancelarPesquisa: TButton
            Left = 161
            Top = 70
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = btnCancelarPesquisaClick
          end
          object edtPedido: TEdit
            Left = 54
            Top = 29
            Width = 121
            Height = 22
            TabOrder = 2
            Text = 'edtPedido'
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 286
            Height = 25
            Align = alTop
            Caption = 'Pesquisa Pedido'
            TabOrder = 3
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'tela'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pnltela: TPanel
          Left = 0
          Top = 0
          Width = 946
          Height = 81
          Align = alTop
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 13
            Width = 38
            Height = 13
            Caption = 'Produto'
            FocusControl = dbeProduto
          end
          object Label8: TLabel
            Left = 19
            Top = 42
            Width = 18
            Height = 13
            Caption = 'Qtd'
            FocusControl = dbedtQuantidade
          end
          object Label9: TLabel
            Left = 238
            Top = 45
            Width = 34
            Height = 13
            Caption = 'Vlr Unit'
            FocusControl = dbedtVlrunitario
          end
          object Label10: TLabel
            Left = 510
            Top = 45
            Width = 39
            Height = 13
            Caption = 'Vlr Total'
            FocusControl = DBEdit13
          end
          object dbeProduto: TDBEdit
            Left = 60
            Top = 11
            Width = 121
            Height = 21
            DataField = 'codigoproduto'
            DataSource = dsItem
            TabOrder = 0
            OnExit = dbeProdutoExit
          end
          object dbedtQuantidade: TDBEdit
            Left = 59
            Top = 42
            Width = 121
            Height = 21
            DataField = 'quantidade'
            DataSource = dsItem
            TabOrder = 2
          end
          object dbedtVlrunitario: TDBEdit
            Left = 278
            Top = 42
            Width = 121
            Height = 21
            DataField = 'vlrunitario'
            DataSource = dsItem
            TabOrder = 3
          end
          object DBEdit13: TDBEdit
            Left = 559
            Top = 42
            Width = 121
            Height = 21
            DataField = 'vlrtotal'
            DataSource = dsItem
            Enabled = False
            TabOrder = 4
          end
          object DBEdit14: TDBEdit
            Left = 202
            Top = 10
            Width = 600
            Height = 21
            CharCase = ecUpperCase
            DataField = 'descricao'
            DataSource = dsItem
            Enabled = False
            TabOrder = 1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 81
          Width = 946
          Height = 41
          Align = alTop
          TabOrder = 1
          ExplicitTop = 87
          object btnConfirmar: TButton
            Left = 320
            Top = 0
            Width = 111
            Height = 39
            Caption = 'Confirmar'
            TabOrder = 0
            OnClick = btnConfirmarClick
          end
          object btncancelarproduto: TButton
            Left = 468
            Top = 0
            Width = 111
            Height = 39
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = btncancelarprodutoClick
          end
        end
      end
    end
    object pnl_totalPedido: TPanel
      Left = 1
      Top = 431
      Width = 946
      Height = 29
      Align = alBottom
      Caption = 'Total 0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitTop = 428
    end
  end
  object pnlRetornaCliente: TPanel
    Left = 639
    Top = 225
    Width = 737
    Height = 129
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object Label4: TLabel
      Left = 11
      Top = 31
      Width = 37
      Height = 14
      Caption = 'Codigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 164
      Top = 37
      Width = 48
      Height = 14
      AutoSize = True
      DataField = 'nome'
      DataSource = dsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 12
      Top = 57
      Width = 36
      Height = 14
      Caption = 'Cidade'
      FocusControl = DBEdit7
    end
    object Label14: TLabel
      Left = 652
      Top = 64
      Width = 14
      Height = 14
      Caption = 'UF'
      FocusControl = DBEdit8
    end
    object dblCliente: TDBLookupComboBox
      Left = 101
      Top = 31
      Width = 57
      Height = 22
      DataField = 'codigocliente'
      DataSource = dsPedido
      DropDownRows = 20
      DropDownWidth = 360
      KeyField = 'codigo'
      ListField = 'nome;codigo'
      ListFieldIndex = 1
      ListSource = dsCliente
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 101
      Top = 57
      Width = 524
      Height = 22
      DataField = 'cidade'
      DataSource = dsCliente
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 677
      Top = 57
      Width = 30
      Height = 22
      DataField = 'uf'
      DataSource = dsCliente
      TabOrder = 2
    end
    object btconfirma: TButton
      Left = 101
      Top = 91
      Width = 75
      Height = 25
      Caption = 'Confirma'
      TabOrder = 3
      OnClick = btconfirmaClick
    end
    object btnCancelarCliente: TButton
      Left = 207
      Top = 91
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClienteClick
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 737
      Height = 25
      Align = alTop
      Caption = 'Pesquisa Cliente'
      TabOrder = 5
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = DM_DB.fdCliente
    Left = 784
    Top = 8
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = DM_DB.fbProduto
    Left = 880
    Top = 8
  end
  object dsPedido: TDataSource
    AutoEdit = False
    DataSet = DM_DB.FDPedido
    OnDataChange = dsPedidoDataChange
    Left = 832
    Top = 8
  end
  object dsItem: TDataSource
    DataSet = DM_DB.FD_item
    Left = 728
    Top = 8
  end
end
