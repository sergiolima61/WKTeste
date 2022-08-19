program WKTecnologia;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  uDM_ in 'uDM_.pas' {DM_DB: TDataModule},
  URegPedidos in 'URegPedidos.pas' {FProspects};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_DB, DM_DB);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
