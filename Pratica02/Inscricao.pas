unit Inscricao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, DateUtils;

type
  TfrmFuncionarios = class(TForm)
    btnSubmeter: TButton;
    btnLimparCampos: TButton;
    lblNome: TLabel;
    edNome: TEdit;
    lblNomeSocial: TLabel;
    edNomeSocial: TEdit;
    rgNomeSocial: TRadioGroup;
    rbNome: TRadioButton;
    rbNomeSocial: TRadioButton;
    lblSexo: TLabel;
    cbSexo: TComboBox;
    lblDataNascimento: TLabel;
    meDataNascimento: TMaskEdit;
    edEmail: TEdit;
    lblEmail: TLabel;
    lblCPF: TLabel;
    meCPF: TMaskEdit;
    meFone: TMaskEdit;
    lblFone: TLabel;
    pnlCadastroDeFuncionarios: TPanel;
    dbgFuncionarios: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edEndereco: TEdit;
    lblEndereco: TLabel;
    edMunicipio: TEdit;
    lblMunicipio: TLabel;
    cbUF: TComboBox;
    lblUF: TLabel;
    lblCEP: TLabel;
    meCEP: TMaskEdit;
    btnCadastrarNovoCancelar: TButton;
    procedure btnCadastrarNovoCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSubmeterClick(Sender: TObject);
    procedure btnLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}



  procedure TfrmFuncionarios.FormCreate(Sender: TObject);
  begin
    frmFuncionarios.Height := 317;
  end;

  procedure TfrmFuncionarios.btnCadastrarNovoCancelarClick(Sender: TObject);
  begin
    if frmFuncionarios.Height = 317 then
    begin
      frmFuncionarios.Height := 620;
      btnCadastrarNovoCancelar.Caption := 'Cancelar';
    end
    else begin
      frmFuncionarios.Height := 317;
      btnCadastrarNovoCancelar.Caption := 'Cadastrar Novo';
    end;
  end;


  // Fun��o que testa se o CPF � v�lido. Fonte: https://www.devmedia.com.br/validando-o-cpf-em-uma-aplicacao-delphi/22180
  function isCPF(CPF: string): boolean;
  var  dig10, dig11: string;
      s, i, r, peso: integer;
  begin
  // length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
    if ((CPF = '00000000000') or (CPF = '11111111111') or
        (CPF = '22222222222') or (CPF = '33333333333') or
        (CPF = '44444444444') or (CPF = '55555555555') or
        (CPF = '66666666666') or (CPF = '77777777777') or
        (CPF = '88888888888') or (CPF = '99999999999') or
        (length(CPF) <> 11))
       then begin
                isCPF := false;
                exit;
              end;

  // try - protege o c�digo para eventuais erros de convers�o de tipo na fun��o StrToInt
    try
      { *-- C�lculo do 1o. Digito Verificador --* }
      s := 0;
      peso := 10;
      for i := 1 to 9 do
      begin
        // StrToInt converte o i-�simo caractere do CPF em um n�mero
        s := s + (StrToInt(CPF[i]) * peso);
        peso := peso - 1;
      end;
      r := 11 - (s mod 11);
      if ((r = 10) or (r = 11))
         then dig10 := '0'
      else str(r:1, dig10); // converte um n�mero no respectivo caractere num�rico

      { *-- C�lculo do 2o. Digito Verificador --* }
      s := 0;
      peso := 11;
      for i := 1 to 10 do
      begin
        s := s + (StrToInt(CPF[i]) * peso);
        peso := peso - 1;
      end;
      r := 11 - (s mod 11);
      if ((r = 10) or (r = 11))then
        dig11 := '0'
      else
        str(r:1, dig11);

      { Verifica se os digitos calculados conferem com os digitos informados. }
      if ((dig10 = CPF[10]) and (dig11 = CPF[11]))then
        isCPF := true
      else
        isCPF := false;
      except
      isCPF := false
    end;
  end;


  function CleanCharacter(Valor: string): String;
     var i,j,posicao, tamanho :integer;
     r, vlr, resultado : string;
  begin
      posicao := 1;
      r := Valor;
      tamanho := Length(Valor);

      if Valor <>'' then
      begin
        for i := 1 to tamanho do
        if ((Valor[i] = '0') or
            (Valor[i] = '1') or
            (Valor[i] = '2') or
            (Valor[i] = '3') or
            (Valor[i] = '4') or
            (Valor[i] = '5') or
            (Valor[i] = '6') or
            (Valor[i] = '7') or
            (Valor[i] = '8') or
            (Valor[i] = '9')) then
        begin
          vlr := vlr + copy(valor,i,posicao);
        end
        else
        begin
          vlr := vlr;
        end;

    end;
    Result := vlr;

  end;


  procedure TfrmFuncionarios.btnSubmeterClick(Sender: TObject);
  var tudoOK: boolean;
      cpfLimpo: String;
  begin
    tudoOK := True;
    if rbNomeSocial.Checked and (edNomeSocial.Text = '') then
    begin
      ShowMessage('Op��o de nome social selecionada, mas campo com nome social em branco. Revise, por favor.');
      tudoOK := False;
    end;

    if YearsBetween(Now(), StrToDate(meDataNascimento.Text)) < 18 then
    begin
      ShowMessage('Pessoa menor de 18 anos!');
      tudoOK := False;
    end;

    cpfLimpo := CleanCharacter(meCPF.Text);
    if isCPF(cpfLimpo) = False then
    begin
      ShowMessage('CPF inv�lido! Revise, por favor!');
      tudoOK := False;
    end;

    if tudoOK then
    begin
      if rbNome.Checked then
      begin
        ShowMessage('Dados salvos com sucesso ' + edNome.Text + '!');
      end
      else
      begin
        ShowMessage('Dados salvos com sucesso ' + edNomeSocial.Text + '!');
      end;
    end;
  end;


  procedure TfrmFuncionarios.btnLimparCamposClick(Sender: TObject);
  begin
    edNome.Text := '';
    edNomeSocial.Text := '';
    rbNome.Checked := True;
    meCPF.Text := '';
    meDataNascimento.Text := '';
    meFone.Text := '';
    edEmail.Text := '';
    edEndereco.Text := '';
    edMunicipio.Text := '';
    meCEP.Text := '';
  end;

  procedure TfrmFuncionarios.FormDestroy(Sender: TObject);
  begin
    application.Terminate;
  end;



procedure TfrmFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    application.Terminate;
  end;

end.
