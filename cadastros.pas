unit cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.NumberBox, Vcl.Imaging.pngimage, Vcl.Menus, Vcl.Buttons;

type
  TCadastro = class(TForm)
    confimarImage: TImage;
    nomeTLabel: TLabel;
    nomeTEdit: TEdit;
    telefoneTEdit: TEdit;
    enderecoTLabel: TLabel;
    emailTEdit: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    function notaFiscal1():boolean;

  private
    { Private declarations }
  public
    { Public declarations }
     var nomeDoCliente,email:String;
         telefoneDoCliente:String;
  end;

var
  Cadastro: TCadastro;
  i:integer;

implementation

{$R *.dfm}

uses nota, pedido, fiscal;





procedure TCadastro.SpeedButton1Click(Sender: TObject);
begin
   //Verifica se algum componentes est� vazio
   for i := 0 to ComponentCount -1 do
   begin
      if Components[i].Tag = 5 then
      begin

        //TEdit
        if Components[i] is TEdit then
        begin
          if ((Components[i] as TEdit).Hint <> '') and
              ((Components[i] as TEdit).Text = '') then
          begin
            ShowMessage('Faltou preencher o campo : '+(Components[i] as TEdit).Hint);
            abort;
          end;

        end;

        //TComboBox
        if Components[i] is TComboBox then
        begin
          if ((Components[i] as TComboBox).Hint <> '') and
              ((Components[i] as TComboBox).Text = 'Nenhum') then
          begin
            ShowMessage('Faltou selecionar o campo : '+(Components[i] as TComboBox).Hint);
            abort;
          end;
        end;

      end;

   end;
   nomeDoCliente := nomeTEdit.Text;
   telefoneDoCliente := telefoneTEdit.Text;
   email := emailTEdit.Text;

   pedidos := Tpedidos.Create(Self);

   //Tirar borda do TComboBox
   SetWindowRgn(pedidos.paises.Handle, CreateRectRgn(4,4,pedidos.paises.Width - 4,pedidos.paises.Height - 4), True);
   SetWindowRgn(pedidos.hotel.Handle, CreateRectRgn(4,4,pedidos.hotel.Width - 4,pedidos.hotel.Height - 4), True);
   SetWindowRgn(pedidos.pacoteExtra.Handle, CreateRectRgn(4,4,pedidos.pacoteExtra.Width - 4,pedidos.pacoteExtra.Height - 4), True);
   notafiscal := TnotaFiscal.Create(Self);
   notaFiscal1();
   pedidos.Show;
   Cadastro.Visible := false;





end;



function TCadastro.notaFiscal1():boolean;
begin
 notaFiscal.nome.Caption := nomeDoCliente;
 notaFiscal.email.Caption := email;
 notaFiscal.telefone.Caption := telefoneDoCliente;
end;

end.
