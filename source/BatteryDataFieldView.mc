
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;

class DataField extends Ui.DataField
{
    hidden var color ;
         
    function initialize() {
        DataField.initialize();
    }
         
    function onUpdate(dc)
    {
    
         color = (getBackgroundColor() == Graphics.COLOR_BLACK) ? Graphics.COLOR_WHITE : Graphics.COLOR_BLACK;

        var flag = getObscurityFlags();
        var width = dc.getWidth();
        var height = dc.getHeight();
          var size_w = 50;
         var size_h = 27;
         var x = width / 2-size_w/2;
         var y = height / 2- size_h/2+5;
        
        dc.setColor( color, Gfx.COLOR_TRANSPARENT );
                
        if(flag>=OBSCURE_BOTTOM){
        	y = y-10;
        	flag=flag-OBSCURE_BOTTOM;
        }
        if(flag>=OBSCURE_RIGHT){
        	x = x-10;
        	flag=flag-OBSCURE_RIGHT;
        } 
        if(flag>=OBSCURE_TOP){
            y = y+10;
        	flag=flag-OBSCURE_TOP;
        }
        if(flag>=OBSCURE_LEFT){
            x = x+10;
        }
                
		drawBattery(System.getSystemStats().battery, dc, x, y, size_w, size_h);	
    }
    

    
    function drawBattery(battery, dc, xStart, yStart, width, height) {                
        dc.drawRectangle(xStart, yStart, width, height);
        dc.fillRectangle(xStart + width - 1, yStart + 7, 4, height - 14);   
       
        if (battery <= 10) {
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        } else if (battery < 30) {
            dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        } else {
            dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        }
        
        var display_perrcentage = App.getApp().getProperty("percentage");
        
        if(display_perrcentage){
            dc.drawText(xStart+width/2 , yStart, Graphics.FONT_SMALL, format("$1$%", [battery.format("%d")]), Graphics.TEXT_JUSTIFY_CENTER);
        }else{
        	dc.fillRectangle(xStart + 1, yStart + 1, (width-2) * battery / 100, height - 2);
        }
    }
}
