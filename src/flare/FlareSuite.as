package flare {
  import flare.tests.AnimationTests;
  import flare.tests.DataIOTests;
  import flare.tests.DataTests;
  import flare.tests.DelimitedTextConverterTest;
  import flare.tests.ExpressionTests;
  import flare.tests.MatrixTests;
  import flare.tests.SortTests;
  import flare.tests.StringFormatTests;
  import flare.tests.TreeTests;
  

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]	
	public class FlareSuite {
	  public var animationTests:AnimationTests;
	  public var dataIOTests:DataIOTests;
	  public var dataTests:DataTests;
	  public var delimitedTextConverterTests:DelimitedTextConverterTest;
	  public var expressionTests:ExpressionTests;
	  public var matrixTests:MatrixTests;
	  public var sortTests:SortTests;
	  public var stringFormatTests:StringFormatTests;
	  public var treeTests:TreeTests;
	}
	
}