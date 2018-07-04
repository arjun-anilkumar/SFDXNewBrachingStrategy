({
    searchKeyChange: function(component, event, helper) {
        var myEvent = $A.get("e.c:SearchKeyChange");
        myEvent.setParams({"searchKey": event.target.value});
        myEvent.fire();
    },
    searchObjName: function(component, event, helper) {
        var myEvent = $A.get("e.c:newEvent");
        myEvent.setParams({"searchKeyObj": document.getElementById('aaa').value});
        myEvent.fire();
    },
})