<aura:application extends="force:slds">
    <lightning:card title="Contact Search">
        <div class="slds-grid slds-gutters">
            <div class="slds-col slds-size_1-of-3 slds-scrollable_y" style = "height:500px">
                <c:RevInputTextField/>
                <c:RevContactList/>
            </div>
            <div class="slds-col slds-size_2-of-3 slds-scrollable_y" style = "height:500px">
                <c:RevViewContactInfo/>
            </div>
        </div>
        
    </lightning:card>
</aura:application>