unit uDM_;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.MySQLDef, FireDAC.Comp.UI, FireDAC.Phys.MySQL, Data.Win.ADODB;

type
  TDM_DB = class(TDataModule)
    FDMysql: TFDConnection;
    fbProduto: TFDQuery;
    fbProdutocodigo: TFDAutoIncField;
    fbProdutodescricao: TStringField;
    fdCliente: TFDQuery;
    FDPedido: TFDQuery;
    FDPedidonumero: TFDAutoIncField;
    FDPedidodataemissao: TDateTimeField;
    FDPedidocodigocliente: TIntegerField;
    FD_item: TFDQuery;
    fdClientecodigo: TFDAutoIncField;
    fdClientenome: TStringField;
    fdClientecidade: TStringField;
    fdClienteuf: TStringField;
    FDPedidonome: TStringField;
    FDPedidoendereco: TStringField;
    FD_itemcodigo: TFDAutoIncField;
    FD_itemcodigoproduto: TIntegerField;
    FD_itemnumeropedido: TIntegerField;
    FD_itemquantidade: TIntegerField;
    FD_itemdescricao: TStringField;
    fdTransacao: TFDQuery;
    FDPedidovalortotal: TBCDField;
    FD_itemvlrtotal: TBCDField;
    FD_itemvlrunitario: TBCDField;
    fbProdutoPrecoVenda: TBCDField;
    procedure FDPedidoAfterScroll(DataSet: TDataSet);
    procedure FD_itemBeforePost(DataSet: TDataSet);
    procedure FD_itemAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_DB: TDM_DB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses  Main , URegPedidos;

{$R *.dfm}

procedure TDM_DB.FDPedidoAfterScroll(DataSet: TDataSet);
begin
  FD_item.Active := false;
  FD_item.Params.ParamByName('pedido').Value := FDPedidonumero.Value;
  FD_item.Active := true;
  //
  fbProduto.Active := false;
  fbProduto.Active := true;
  //
end;

procedure TDM_DB.FD_itemAfterPost(DataSet: TDataSet);
var vtotal :Float64;
begin
    //
    if DM_DB.FDPedidonumero.Value<>0 then
    begin
      DM_DB.fdTransacao.Active := false ;
      DM_DB.fdTransacao.SQL.Text := ' select sum(vlrtotal) total FROM wk.pedidoproduto where numeropedido= :id ';
      DM_DB.fdTransacao.Params.ParamByName('id').Value := DM_DB.FDPedidonumero.Value;
      DM_DB.fdTransacao.Active := true;
      //
      if not DM_DB.fdTransacao.eof then
      begin
        vtotal := DM_DB.fdTransacao.FieldByName('total').Value;
        //
        DM_DB.FDPedido.Edit;
        DM_DB.FDPedidovalortotal.AsFloat  := vtotal;
        DM_DB.FDPedido.Post;
      end;
    end;
end;

procedure TDM_DB.FD_itemBeforePost(DataSet: TDataSet);
begin

   if FD_item.state = dsinsert then
   begin
     FD_itemnumeropedido.Value   :=  FDPedidonumero.Value;
   end;
   FD_item.FieldByName('vlrtotal').Value    := ( FD_item.FieldByName('vlrunitario').Value  * FD_item.FieldByName('quantidade').Value  );
   //
end;

end.
