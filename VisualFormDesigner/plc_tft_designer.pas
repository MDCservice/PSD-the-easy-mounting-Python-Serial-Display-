program plc_tft_designer;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, pl_exdesign, lz_tachart, screenprops, HTML_edit, form_ide_main;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmIDEmain, frmIDEmain);
  //Application.CreateForm(TfrmScreenProps, frmScreenProps);
  Application.Run;
end.

