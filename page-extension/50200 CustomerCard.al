pageextension 50202 ACDPE502 extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Customer")
        {
            action(ArticoloCorellato)
            {
                ApplicationArea = All;
                Caption = 'Articoli cliente';
                Image = Customer;
                Promoted = false;
                //lancio la pagina
                RunObject = Page "Item List";
                //filtrare gli articoli per clienti
                RunPageLink = "ACD Customer No." = field("No.");
            }
        }
    }

    var
        myInt: Integer;

}