package {

  import flare.query.Query;
  import flare.query.methods.*;
  import mx.utils.ObjectUtil;
  
  import flexunit.framework.TestCase;
  
  import mx.collections.ArrayCollection;
  
  import org.juicekit.flare.query.LiveQuery;

  public class LiveQueryTest extends TestCase {
    public var stateData:ArrayCollection = new ArrayCollection([
     {state: 'VA', cnt: 1},
     {state: 'PA', cnt: 2},
     {state: 'VA', cnt: 1},
     {state: 'PA', cnt: 2}
    ]);

    public function testLiveQuery():void {
      var lq:LiveQuery = new LiveQuery();
      lq.dataProvider = stateData;
      lq.query = new Query(['state', {sum: sum('cnt')}], null, ['state'], ['state']);
      assertEquals(ObjectUtil.compare([{state: 'PA', sum: 4}, {state: 'VA', sum: 2}],
                                      lq.result.source), 0)
      // adding an item to the dataProvider causes the result to update                                  
      stateData.addItem({state: 'VT', cnt: 5});
      assertEquals(ObjectUtil.compare([{state: 'PA', sum: 4}, {state: 'VA', sum: 2}, {state: 'VT', sum: 5}],
                                      lq.result.source), 0)
      stateData.addItem({state: 'VA', cnt: 5});
      assertEquals(ObjectUtil.compare([{state: 'PA', sum: 4}, {state: 'VA', sum: 7}, {state: 'VT', sum: 5}],
                                      lq.result.source), 0)

      
    }

  }
}