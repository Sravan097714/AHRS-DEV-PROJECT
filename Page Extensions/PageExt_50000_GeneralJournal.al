pageextension 50012 "General Journal" extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
        modify("Debit Amount")
        {
            Visible = true;
        }
        modify("Credit Amount")
        {
            Visible = true;
        }
    }

    actions
    {
        addafter("Request Approval")
        {
            action("Import Entries")
            {
                ApplicationArea = All;
                Caption = 'Import Entries';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                Visible = false;
                ToolTip = 'Import journal from desktop';

                trigger OnAction()
                var
                    GenImportData: Codeunit "Import Files";
                begin
                    GenImportData.SetJournalTemplateBatch(Rec."Journal Template Name", Rec."Journal Batch Name");
                    GenImportData.ImportGenJnlFile();
                end;
            }
        }
    }
}