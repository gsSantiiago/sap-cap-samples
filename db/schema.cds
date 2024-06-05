namespace db;

entity Users {
    id: UUID;
    name: String(100);
    city: String(3);
}

entity Cities {
    id: String(3);
    description: String(100);
    country: String(3);
}

entity Countries {
    id: String(3);
    description: String(100);
}

annotate Users with @(
    UI.SelectionFields: [
        name,
        city
    ],
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : city,
        },
    ]
) {
    city @(
        Common : { 
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Cities',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        ValueListProperty : 'id',
                        LocalDataProperty : city,
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'description'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'country'
                    }
                ]
            },
        },
    )
};

annotate Cities with @(
    UI.SelectionFields: [
        country
    ],
) {
    country @(
        Common : { 
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Countries',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        ValueListProperty : 'id',
                        LocalDataProperty : country,
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'description'
                    }
                ]
            },
        },
    )
}
