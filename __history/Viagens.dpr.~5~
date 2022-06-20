program Viagens;

uses
  Vcl.Forms,
  cadastros in 'cadastros.pas' {Form1},
  pedido in 'pedido.pas' {pedidos},
  pagamento in 'pagamento.pas' {formaDePagamento},
  fiscal in 'fiscal.pas' {notaFiscal},
  agradecimento in 'agradecimento.pas' {Calu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCadastro, Cadastro);
  Application.CreateForm(Tpedidos, pedidos);
  Application.CreateForm(TformaDePagamento, formaDePagamento);
  Application.CreateForm(TnotaFiscal, notaFiscal);
  Application.CreateForm(TCalu, Calu);
  Application.Run;
end.
