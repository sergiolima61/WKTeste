unit URegPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.TeeProcs,
  VclTee.Chart, VclTee.DBChart, Vcl.DBCGrids, VclTee.Series;

type
  TFProspects = class(TForm)
    dsCliente: TDataSource;
    dsProduto: TDataSource;
    dsPedido: TDataSource;
    dsItem: TDataSource;
    pnlPrincipal: TPanel;
    pnlPedido: TPanel;
    Label1: TLabel;
    dbednumero: TDBEdit;
    dbedtcodigocliente: TDBEdit;
    pnlRetornaCliente: TPanel;
    Label4: TLabel;
    DBText1: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    dblCliente: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    btnpesquisacliente: TButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel3: TPanel;
    btn_novo: TButton;
    btncancelar: TButton;
    btngravar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    btconfirma: TButton;
    btnCancelarCliente: TButton;
    Panel1: TPanel;
    NTB_pedidoproduto: TNotebook;
    dbpedidoproduto: TDBGrid;
    pnltela: TPanel;
    Label7: TLabel;
    dbeProduto: TDBEdit;
    Label8: TLabel;
    dbedtQuantidade: TDBEdit;
    Label9: TLabel;
    dbedtVlrunitario: TDBEdit;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Panel2: TPanel;
    btnConfirmar: TButton;
    btncancelarproduto: TButton;
    pnl_totalPedido: TPanel;
    pnlPesquisaPedido: TPanel;
    Label3: TLabel;
    btnConfirmaPesquisa: TButton;
    btnCancelarPesquisa: TButton;
    btnPesquisa: TButton;
    edtPedido: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_novoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PG_RegPedidosChange(Sender: TObject);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure PC_FunilChange(Sender: TObject);
    procedure Carrega_prospecto;
    procedure dbpedidoprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnpesquisaclienteClick(Sender: TObject);
    procedure btconfirmaClick(Sender: TObject);
    procedure btnCancelarClienteClick(Sender: TObject);
    procedure controle;
    procedure btnExcluirClick(Sender: TObject);
    procedure dbeProdutoExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btncancelarprodutoClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnConfirmaPesquisaClick(Sender: TObject);
    procedure btnCancelarPesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProspects: TFProspects;

implementation

{$R *.dfm}

uses
  Main,
  uDM_;

procedure TFProspects.btconfirmaClick(Sender: TObject);
begin
  pnlRetornaCliente.Visible := false;
  pnlPedido.Enabled := not(pnlRetornaCliente.Visible);
  DM_DB.FDPedido.fieldbyname('endereco').value :=  concat(DM_DB.FDcliente.fieldbyname('cidade').value, ' ', DM_DB.FDcliente.fieldbyname('uf').value);
  DM_DB.FDPedido.fieldbyname('nome').value := DM_DB.FDcliente.fieldbyname('nome').value;
  dbedtcodigocliente.SetFocus;
end;

procedure TFProspects.btn_novoClick(Sender: TObject);
begin
  DM_DB.FDPedido.Append;
  DM_DB.FDPedido.fieldbyname('DATAemissao').value := now;
  controle;

end;

procedure TFProspects.btncancelarClick(Sender: TObject);
begin
  if DM_DB.FDPedido.State <> dsBrowse then
  begin
    DM_DB.FDPedido.Cancel;
    DM_DB.FDMysql.Rollback;
    controle;
  end;
end;

procedure TFProspects.btncancelarprodutoClick(Sender: TObject);
begin
  try
    with DM_DB do
    begin
      DM_DB.FD_item.Cancel;;
      NTB_pedidoproduto.PageIndex := 0;
    end;
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFProspects.btngravarClick(Sender: TObject);
Var
  pacao: string;
begin
  try
    if dbedtcodigocliente.Text = EmptyStr then
    begin
      ShowMessage('Codigo Cliente' + #13 + 'nao informado .');
      dbedtcodigocliente.SetFocus;
      exit;
    end;

    with DM_DB do
    begin
      DM_DB.FDPedido.Post;
      controle;
      DM_DB.FDMysql.Commit;
    end;
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFProspects.btnPesquisaClick(Sender: TObject);
begin
  if not ( DM_DB.FDPedido.State in [dsEdit, dsInsert] ) then
  begin
    pnlPesquisaPedido.Visible := true;
    pnlPesquisaPedido.Top := 15;
    pnlPesquisaPedido.left := 301;
    edtPedido.Text := EmptyStr;
    edtPedido.SetFocus;
    pnlPedido.Enabled := not(pnlRetornaCliente.Visible);
  end;

end;

procedure TFProspects.btnEditarClick(Sender: TObject);
begin
  DM_DB.FDPedido.Edit;
  controle;
end;

procedure TFProspects.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do Pedido ?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    DM_DB.fdTransacao.Active := false;
    DM_DB.fdTransacao.SQL.Text := ' delete FROM wk.pedidoproduto where numeropedido= :id ';
    DM_DB.fdTransacao.Params.ParamByName('id').value := DM_DB.FDPedidonumero.value;
    DM_DB.fdTransacao.ExecSQL;
    //
    DM_DB.FDPedido.Delete;
    DM_DB.FDMysql.Commit;
  end;

  controle;
end;

procedure TFProspects.btnpesquisaclienteClick(Sender: TObject);
begin
  if DM_DB.FDPedido.State in [dsEdit, dsInsert] then
  begin
    pnlRetornaCliente.Visible := true;
    pnlRetornaCliente.Top := 130;
    pnlRetornaCliente.left := 040;

    dblCliente.SetFocus;
    pnlPedido.Enabled := not(pnlRetornaCliente.Visible);
  end;
end;

procedure TFProspects.btnConfirmaPesquisaClick(Sender: TObject);
begin

    DM_DB.fdTransacao.Active := false;
    DM_DB.fdTransacao.SQL.Text :=  ' SELECT numero  FROM wk.pedido where numero = ' + edtPedido.Text;
    DM_DB.fdTransacao.Active := true;

    if DM_DB.fdTransacao.IsEmpty then
    begin
      ShowMessage('Numero do pedido .' + #13 + 'não foi localizado tente novamente.');
      edtPedido.SetFocus;
      exit;
    end Else
    begin
      DM_DB.FDPedido.Locate('numero',edtPedido.Text,[]  );
      pnlPesquisaPedido.Visible := false;
    end;

end;

procedure TFProspects.btnConfirmarClick(Sender: TObject);
var
  vtotal: Float64;
begin
  if dbeProduto.Text = EmptyStr then
  begin
    ShowMessage('Código Produto.' + #13 + 'Invalido favor tentar novamente.');
    dbeProduto.SetFocus;
    exit;
  end;
  //
  if dbedtQuantidade.Text = EmptyStr then
  begin
    ShowMessage('quantidade .' + #13 + 'Invalido favor tentar novamente.');
    dbedtQuantidade.SetFocus;
    exit;
  end;
  //
  if dbedtVlrunitario.Text = EmptyStr then
  begin
    ShowMessage('valor unitario .' + #13 + 'Invalido favor tentar novamente.');
    dbedtVlrunitario.SetFocus;
    exit;
  end;
  //

  try
    DM_DB.FD_item.Post;
    NTB_pedidoproduto.PageIndex := 0;
    DM_DB.FDMysql.Commit;
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;
end;

procedure TFProspects.btnCancelarClienteClick(Sender: TObject);
begin
  pnlRetornaCliente.Visible := false;
  pnlPedido.Enabled := not(pnlRetornaCliente.Visible);
end;

procedure TFProspects.btnCancelarPesquisaClick(Sender: TObject);
begin
      pnlPesquisaPedido.Visible := false;
end;

procedure TFProspects.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  pnl_totalPedido.Caption := concat('Total Pedido  ',
    FormatFloat(',#0.00', DM_DB.FDPedidovalortotal.AsFloat), #32, #32,
    FormatFloat('0###', DM_DB.FDPedido.RecNo), '/',
    FormatFloat('0###', DM_DB.FDPedido.RecordCount));
end;

procedure TFProspects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FDcliente.CLOSE;
  DM_DB.FDPedido.CLOSE;
  DM_DB.FD_item.CLOSE;
  DM_DB.fbProduto.CLOSE;
end;

procedure TFProspects.FormCreate(Sender: TObject);
begin
  //
  DM_DB.FDcliente.Open;
  //
  Carrega_prospecto;
  NTB_pedidoproduto.PageIndex := 0;
end;

procedure TFProspects.PC_FunilChange(Sender: TObject);
begin
  Carrega_prospecto;
end;

procedure TFProspects.PG_RegPedidosChange(Sender: TObject);
begin

  DM_DB.FDPedido.CLOSE;
  DM_DB.FDPedido.Params.ParamByName('ACAO').value := 'C';
  //
  DM_DB.FDPedido.Params.ParamByName('IDP').value := 0;
  //
  DM_DB.FDPedido.Open;
  //
end;

procedure TFProspects.Carrega_prospecto;
begin
  DM_DB.FDPedido.CLOSE;
  DM_DB.FDPedido.Open;
end;

procedure TFProspects.dbpedidoprodutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        // alteração
        if not DM_DB.FD_item.IsEmpty then
        begin
          NTB_pedidoproduto.PageIndex := 1;
          DM_DB.FD_item.Edit;
        end
        Else
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Pedido Produto sem Lançamento para alterar .');
        end;
      end;
    vk_insert:
      begin
        // incluir
        NTB_pedidoproduto.PageIndex := 1;
        DM_DB.FD_item.Append;
        DM_DB.FD_itemquantidade.value := 1;
      end;
    VK_DELETE:
      begin
        // Apagar
        if not DM_DB.FD_item.IsEmpty then
        begin
          if MessageDlg('Confirma a exclusão do Produto?',
            TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0)
            = idYes then
            DM_DB.FD_item.Delete;
        end
        Else
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Item sem Lançamento para Excluir .');
        end;
      end;
  end;

end;

//
procedure TFProspects.controle;
begin

  if DM_DB.FDPedido.State in [dsInsert, dsEdit] then
  begin
    btn_novo.Enabled := false;
    btnEditar.Enabled := (btn_novo.Enabled);
    btnExcluir.Enabled := (btn_novo.Enabled);
    btngravar.Enabled := not(btn_novo.Enabled);
    btncancelar.Enabled := not(btn_novo.Enabled);
    pnlPedido.Enabled := not(btn_novo.Enabled);
    btnpesquisacliente.Enabled := not(btn_novo.Enabled);
    btnPesquisa.Enabled := not(btn_novo.Enabled);
  end
  Else
  begin
    btn_novo.Enabled := true;
    btnEditar.Enabled := (btn_novo.Enabled);
    btnExcluir.Enabled := (btn_novo.Enabled);
    btngravar.Enabled := not(btn_novo.Enabled);
    btncancelar.Enabled := not(btn_novo.Enabled);
    pnlPedido.Enabled := not(btn_novo.Enabled);
    btnpesquisacliente.Enabled := not(btn_novo.Enabled);
    btnPesquisa.Enabled := not(btn_novo.Enabled);
  end;

end;

procedure TFProspects.dbeProdutoExit(Sender: TObject);
begin

  if dbeProduto.Text <> EmptyStr then
  begin
    DM_DB.fbProduto.CLOSE;
    DM_DB.fbProduto.Params.ParamByName('codigo').value :=
      StrToInt(dbeProduto.Text);
    DM_DB.fbProduto.Open;
    if not DM_DB.fbProduto.Eof then
    begin
      DM_DB.FD_itemdescricao.value := DM_DB.fbProdutodescricao.value;
      DM_DB.FD_itemvlrunitario.value := DM_DB.fbProdutoPrecoVenda.value;
    end
    Else
    begin
      ShowMessage('Código Produto.' + #13 + 'Invalido favor tentar novamente.');
      dbeProduto.SetFocus;
      exit;
    end;
  end;

end;

end.
