<aura:application extends="force:slds">
    <aura:attribute name="value" type="List" default="option1"/>
    <c:ClassroomHeader value="{!v.value}"/>
</aura:application>