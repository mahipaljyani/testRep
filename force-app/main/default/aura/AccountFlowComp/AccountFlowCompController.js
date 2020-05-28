({
    init: function (cmp) {
        var items = [];
        for (var i = 0; i < 15; i++) {
            var item = {
                "label": "Option " + i,
                "value": "opt" + i
            };
            items.push(item);
        }
        cmp.set("v.options", items);
        var greetingValueArray = cmp.get('v.valuesStringFromFlow').toString().replace('[', '').replace(']', '').split(";");
        //alert(greetingValueArray + '');
        var valueOptionArray = [];
        for(var i = 0; i < greetingValueArray.length; i++) {
            valueOptionArray.push(greetingValueArray[i]);
        }
        //alert('valueOptionArray : ' + valueOptionArray);
        cmp.set('v.values', valueOptionArray);
    },
    
    handleChange: function (cmp, event) {
        var selectedOptionValue = event.getParam("value");
        //alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
        cmp.set("v.valuesString", selectedOptionValue.toString());
        //cmp.set("v.valuesString", '[' + selectedOptionValue.toString().replace(',', ';') + ']');
    }
})