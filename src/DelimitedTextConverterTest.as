package {

  import flare.data.converters.DelimitedTextConverter;
  import flare.query.Query;
  import flare.query.methods.*;
  
  import flexunit.framework.TestCase;
  
  import mx.collections.ArrayCollection;
  import mx.utils.ObjectUtil;
  
  import org.juicekit.flare.query.LiveQuery;

  public class DelimitedTextConverterTest extends TestCase {
    public function testDLCCommas():void {
      var s:String = 'a,b,c\n1,2,3\n3,4,5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:2,c:3}, {a:3,b:4,c:5}], results), 0)
    }

    public function testDLCEmbeddedComma():void {
      var s:String = 'a,b,c\n1,"2,3",3\n3,4,5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:"2,3",c:3}, {a:3,b:"4",c:5}], results), 0)
    }

    public function testDLCEmbeddedNewlineComma():void {
      var s:String = 'a,b,c\n1,"2,\n3",3\n3,4,5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:"2,\n3",c:3}, {a:3,b:"4",c:5}], results), 0)
    }

    public function testDLCWikipediaExample():void {
      //http://en.wikipedia.org/wiki/Comma-separated_values
      var s:String = 'year,make,model,features,price\n1997,Ford,E350,"ac, abs, moon",3000.00\n1999,Chevy,"Venture ""Extended Edition""","",4900.00\n1996,Jeep,Grand Cherokee,"MUST SELL!\nair, moon roof, loaded",4799.00';
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(3, results.length);
      assertEquals(ObjectUtil.compare({year:1997 ,make: "Ford" 	,model:'E350',                       features:'ac, abs, moon', 	                    price:3000}, results[0]), 0);
      assertEquals(ObjectUtil.compare({year:1999 ,make: "Chevy" ,model:'Venture "Extended Edition"', features:'',                                   price:4900}, results[1]), 0);
      assertEquals(ObjectUtil.compare({year:1996 ,make: "Jeep" 	,model:'Grand Cherokee' 	         , features:'MUST SELL!\nair, moon roof, loaded', 	price:4799}, results[2]), 0);
    }

    public function testDLCEmbeddedDoubleQuoteComma():void {
      var s:String = 'a,b,c\n1,"""2,3""",3\n3,4,5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:'"2,3"',c:3}, {a:3,b:"4",c:5}], results), 0)
    }

    public function testDLCEmbeddedDoubleQuoteComma2():void {
      var s:String = 'a,b,c\n1,2,3"",3\n3,4,5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter(',');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:2,c:'3"'}, {a:3,b:4,c:"5"}], results), 0)
    }

    public function testDLCTabs():void {
      var s:String = 'a\tb\tc\n1\t2\t3\n3\t4\t5'
      var dtc:DelimitedTextConverter = new DelimitedTextConverter('\t');
      var results:Array = dtc.parse(s).nodes.data;
      assertEquals(2, results.length);
      assertEquals(ObjectUtil.compare([{a:1,b:2,c:3}, {a:3,b:4,c:5}], results), 0)
    }

  }
}