pageextension 50201 ACDPE50201 extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("ACD Customer No."; Rec."ACD Customer No.")
            {
                Caption = 'Customer No.';

                trigger OnValidate()
                var

                    Customer: Record Customer;

                begin

                    Customer.get(rec."ACD Customer No.");
                    if Customer.Blocked <> Customer.Blocked::" " then
                        Customer.TestField(Blocked, Customer.Blocked::" ");

                end;
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