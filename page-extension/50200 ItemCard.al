pageextension 50201 ACDPE50201 extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("ACD Customer No."; Rec."ACD Customer No.")
            {
                Caption = 'Customer No.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}