tableextension 50201 ACDTE50201 extends Item // ACD + NOME TABELLA OGNI VOLTA CHE CREIAMO UNA TABELLA
{

    fields
    {
        field(50201; "ACD Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
    }


    var
        myInt: Integer;
}