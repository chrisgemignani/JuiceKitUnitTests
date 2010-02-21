package juicekit.tests {

  import flare.query.methods.*;
  import flare.vis.data.NodeSprite;
  import flare.vis.data.Tree;
  
  import flexunit.framework.TestCase;
  
  import mx.collections.ArrayCollection;
  
  import org.juicekit.util.data.GraphUtil;

  /**
  * Tests of treemap generation with GraphUtil.treeMap
  */
  public class GraphUtilTreeMapTest extends TestCase {
    public var stateData:ArrayCollection = new ArrayCollection([
     {state: 'VA', cnt: 1},
     {state: 'PA', cnt: 2},
     {state: 'VA', cnt: 1},
     {state: 'PA', cnt: 2}
    ]);

    public function testLiveQuery():void {
      var t:Tree = GraphUtil.treeMap(stateData.source,
                                     ['state'], 
                                     ['cnt']);
      // root node and a node for each state
      assertEquals(3, t.nodes.length); 
      assertEquals(t.root.data.name, 'All');
      var n1:NodeSprite = t.root.getChildNode(0);
      var n2:NodeSprite = t.root.getChildNode(1);
      assertEquals(n1.data.name, 'PA');
      assertEquals(n1.data.cnt, 4);
      assertEquals(n2.data.name, 'VA');
      assertEquals(n2.data.cnt, 2);
      
    }

  }
}