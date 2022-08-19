object DM_DB: TDM_DB
  OldCreateOrder = False
  Height = 355
  Width = 520
  object FDMysql: TFDConnection
    Params.Strings = (
      'Database=wk'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object fbProduto: TFDQuery
    Connection = FDMysql
    SQL.Strings = (
      'SELECT codigo,descricao,PrecoVenda FROM wk.produto'
      'where codigo = :codigo;')
    Left = 48
    Top = 96
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fbProdutocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fbProdutodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object fbProdutoPrecoVenda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PrecoVenda'
      Origin = 'PrecoVenda'
      DisplayFormat = ',#0.00'
      Precision = 10
      Size = 2
    end
  end
  object fdCliente: TFDQuery
    Connection = FDMysql
    SQL.Strings = (
      'select codigo,nome,cidade,uf from wk.cliente')
    Left = 40
    Top = 144
    object fdClientecodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdClientenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object fdClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object FDPedido: TFDQuery
    AfterScroll = FDPedidoAfterScroll
    Connection = FDMysql
    SQL.Strings = (
      'SELECT ped.numero,'
      '       ped.dataemissao,'
      '       ped.codigocliente,'
      '       ped.valortotal,'
      '       cli.nome,'
      '       Concat(cli.cidade, '#39' '#39', cli.uf) endereco'
      'FROM   pedido ped'
      '       LEFT JOIN cliente cli'
      '              ON cli.codigo = ped.codigocliente ')
    Left = 40
    Top = 200
    object FDPedidonumero: TFDAutoIncField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDPedidodataemissao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
      ProviderFlags = [pfInUpdate]
    end
    object FDPedidocodigocliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigocliente'
      Origin = 'codigocliente'
      ProviderFlags = [pfInUpdate]
    end
    object FDPedidonome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object FDPedidoendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      ProviderFlags = []
      Required = True
      Size = 103
    end
    object FDPedidovalortotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
      DisplayFormat = ',#0.00'
      Precision = 10
      Size = 2
    end
  end
  object FD_item: TFDQuery
    BeforePost = FD_itemBeforePost
    AfterPost = FD_itemAfterPost
    AfterDelete = FD_itemAfterPost
    Connection = FDMysql
    SQL.Strings = (
      
        'SELECT ppd.codigo'#10'       ,ppd.codigoproduto'#10'       ,ppd.numerope' +
        'dido'#10'       ,ppd.quantidade'#10'       ,ppd.vlrtotal'#10'       ,ppd.vlr' +
        'unitario'#10' ,prd.descricao        FROM wk.pedidoproduto ppd'#10'      ' +
        ' LEFT JOIN wk.produto prd'#10'              ON prd.codigo = ppd.codi' +
        'goproduto'#10'where ppd.numeropedido = :pedido              ;       ' +
        '      ; ')
    Left = 40
    Top = 264
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FD_itemcodigo: TFDAutoIncField
      DisplayLabel = 'autoincrem'
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FD_itemnumeropedido: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Pedido'
      FieldName = 'numeropedido'
      Origin = 'numeropedido'
      ProviderFlags = [pfInUpdate]
    end
    object FD_itemcodigoproduto: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'codigoproduto'
      Origin = 'codigoproduto'
      ProviderFlags = [pfInUpdate]
    end
    object FD_itemdescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 80
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      Required = True
      Size = 80
    end
    object FD_itemquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
      ProviderFlags = [pfInUpdate]
    end
    object FD_itemvlrunitario: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'vlr unitario'
      FieldName = 'vlrunitario'
      Origin = 'vlrunitario'
      DisplayFormat = ',#0.00'
      Precision = 10
      Size = 2
    end
    object FD_itemvlrtotal: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'vlr total'
      FieldName = 'vlrtotal'
      Origin = 'vlrtotal'
      DisplayFormat = ',#0.00'
      Precision = 10
      Size = 2
    end
  end
  object fdTransacao: TFDQuery
    Connection = FDMysql
    SQL.Strings = (
      ''
      
        ' select sum(vlrtotal) total FROM wk.pedidoproduto where numerope' +
        'dido= :id')
    Left = 200
    Top = 152
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
