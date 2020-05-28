public class VfController {
    public String selectedname{get;set;}
    public List<Selectoption> PicklistValue{get;set;}
    public boolean showCon{get;set;}

    public VfController(ApexPages.StandardSetController sc){
        PicklistValue = gettingPicklistValue();
    }
    
    public void selectItemChanged()
    {
        //System.debug('in asdasdf_');
        //System.debug(selectedname);
    }    
    
    Public List<Selectoption> gettingPicklistValue(){
        List<Selectoption> pickVal = new List<selectoption>();
        pickVal.add(New SelectOption('Contact','Contact'));
        pickVal.add(New SelectOption('Opportunities','Opportunities'));
        pickVal.add(New SelectOption('Cases','Cases'));
        return pickVal;
    }
    
}