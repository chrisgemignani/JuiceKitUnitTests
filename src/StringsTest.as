package {

  import flare.util.Strings;
  
  import flexunit.framework.TestCase;


  public class StringsTest extends TestCase {

    /**
     * Test Deposit
     */
    public function testStringsFormat():void {
      var d:Number = 12345.9876543210;
      var c:Number = 12345.30100;

      // TODO: this does not work, decimals disables comma truncating
      // assertEquals('12.3',           Strings.format('{0:0.0,}', 12345));
      
      assertEquals('1',              Strings.format('{0:0,}', 1000));
      assertEquals('100.000',        Strings.format('{0:0.000}', 100));
      assertEquals('10.000',         Strings.format('{0:0.000}', 10));
      assertEquals('1.000',          Strings.format('{0:0.000}', 1));
      assertEquals("(1234)",         Strings.format("{0:##;(##)}", -1234));
      assertEquals("1234",           Strings.format("{0:##}", 1234));
      assertEquals("1234",           Strings.format("{0:00}", 1234));
      assertEquals("123",            Strings.format("{0:#####}", 123));
      assertEquals("00123",          Strings.format("{0:00000}", 123));
      assertEquals("(123) 456 - 7890", Strings.format("{0:(###) ### - ####}", 1234567890));
      assertEquals("1.2",            Strings.format("{0:#.##}", 1.2));
      assertEquals("1.20",           Strings.format("{0:0.00}", 1.2));
      assertEquals("01.20",          Strings.format("{0:00.00}", 1.2));
      assertEquals("1,234,567,890",  Strings.format("{0:#,#}", 1234567890));
      assertEquals("1235",           Strings.format("{0:#,,}", 1234567890));
      assertEquals("1",              Strings.format("{0:#,,,}", 1234567890));
      assertEquals("1,235",          Strings.format("{0:#,##0,,}", 1234567890));
      assertEquals("8.6%",           Strings.format("{0:#0.##%}", 0.086));
      assertEquals("8.6E+4",         Strings.format("{0:0.###E+0}", 86000));
      assertEquals("8.6E+004",       Strings.format("{0:0.###E+000}", 86000));
      assertEquals("8.6E004",        Strings.format("{0:0.###E-000}", 86000));
      assertEquals("[12-34-56]",     Strings.format("{0:[##-##-##]}", 123456));
      assertEquals("1234",           Strings.format("{0:##;(##)}", 1234));
      assertEquals("0012345",        Strings.format("{0:0000000}", c));
      assertEquals("12345",          Strings.format("{0:#######}", c));
      assertEquals("0012345.3010",   Strings.format("{0:0000000.0000#}", c));
      assertEquals("12345.301",      Strings.format("{0:#######.#####}", c));
      assertEquals("01234530%",      Strings.format("{0:00000000%}", c));
      assertEquals("1234530%",       Strings.format("{0:########%}", c));
      assertEquals("1.23e04",        Strings.format("{0:0.00e00}", c));
      assertEquals("1.23e04",        Strings.format("{0:#.##e00}", c));
      assertEquals("1.e+04-23",      Strings.format("{0:0.e+00.-00}", c));
      assertEquals("1.e+04-23",      Strings.format("{0:#.e+00.-##}", c));
      assertEquals("012",            Strings.format("{0:000,}", c));
      assertEquals("12",             Strings.format("{0:###,}", c));
      assertEquals("12",             Strings.format("{0:0,}", c));
      assertEquals("12",             Strings.format("{0:#,}", c));
      assertEquals("12      ",       Strings.format("{0,-8:#,}", c));
      assertEquals("      12",       Strings.format("{0,8:#,}", c));
      assertEquals("12,345.30",      Strings.format("{0:00,000.00}", c));
      assertEquals("12,345.3",       Strings.format("{0:##,###.##}", c));
      assertEquals("12,345.30",      Strings.format("{0:0,0.00}", c));
      assertEquals("12,345.3",       Strings.format("{0:#,#.##}", c));
      assertEquals("$123",           Strings.format("{0:$0;($0);Zero}", 123));
      assertEquals("($123)",         Strings.format("{0:$0;($0);Zero}", -123));
      assertEquals("Zero",           Strings.format("{0:$0;($0);Zero}", 0));
      assertEquals("0012346",        Strings.format("{0:0000000}", d));
      assertEquals("12346",          Strings.format("{0:#######}", d));
      assertEquals("0012345.99",     Strings.format("{0:0000000.00}", d));
      assertEquals("12345.99",       Strings.format("{0:#######.##}", d));
      assertEquals("321.001e42%",    Strings.format("{0:000.000e0,0%}", 32100.123));
      assertEquals("3210012.300%",   Strings.format("{0:000.000%}", 32100.123));
      assertEquals("3210012%",       Strings.format("{0:000%}", 32100.123));
      assertEquals("32,100.1",       Strings.format("{0:0,0.0}", 32100.123));
      assertEquals("32100",          Strings.format("{0:0}", 32100.123));
      assertEquals("32100",          Strings.format("{0:00}", 32100.123));
      assertEquals("32,100,123",     Strings.format("{0:0,0000,0}", 32100123));
      assertEquals("032,100.123123", Strings.format("{0:00000,0,.000000}", 32100123.123456789));
      assertEquals("3210012.3e%",    Strings.format("{0:###.###e#,#%}", 32100.123));
      assertEquals("321,001%",       Strings.format("{0:0,000%}", 3210.01));
      assertEquals("3210%01",        Strings.format("{0:00%00}", 3210.01));
      assertEquals("1.23e+8-45e7",   Strings.format("{0:0.00e+0-00e0}", 123456789));
      assertEquals("123456789.00e+", Strings.format("{0:0.00e+}", 123456789));
      assertEquals("123456789.00e",  Strings.format("{0:0.00e}", 123456789));
      assertEquals("1ea.23e+08",     Strings.format("{0:0ea.00e+00}", 123456789));
      assertEquals("123e+06.46",     Strings.format("{0:###e+00.00}", 123456789));
      assertEquals("1.23e+17",       Strings.format("{0:0.00e+0}", 123456789000000000));
      assertEquals("1,234,567.89",   Strings.format("{0:0,0.0,0,,,}", 1234567.89));
      assertEquals("1,234,-5-67.89", Strings.format("{0:0,0-0-0,0.00}", 1234567.89));
      assertEquals("12345",          Strings.format("{0:###000}", 12345));
      assertEquals("012345",         Strings.format("{0:000###}", 12345));
      assertEquals("000,012,345",    Strings.format("{0:0000000,00}", 12345));
      assertEquals("1.234e+56",      Strings.format("{0:0.########e+0}", 1.234e56));
      assertEquals("4.321e-56",      Strings.format("{0:0.########e-0}", 4.321e-56));
      assertEquals("0.0",            Strings.format("{0:0.0}", 7.1E-15));
      assertEquals("1.0",            Strings.format("{0:0.0}", 1 + 7.1E-15));
      assertEquals("1.0",            Strings.format("{0:0.0}", 0.9999999999));
      assertEquals("1",              Strings.format("{0:0.#######}", 0.9999999999));
      assertEquals("1000000000000",  Strings.format("{0:0}", 1000000000000.0));
        // standard formatters
      assertEquals("$12,345.00",     Strings.format("{0:c}", 12345));
      assertEquals("$12,345.0000",   Strings.format("{0:C04}", 12345));
      assertEquals("12345",          Strings.format("{0:d}", 12345));
      assertEquals("012345",         Strings.format("{0:D6}", 12345));
      assertEquals("1.23e+4",        Strings.format("{0:e}", 12345));
      assertEquals("1.23E-4",        Strings.format("{0:E}", 0.00012345));
      assertEquals("1.2345e+10",     Strings.format("{0:e4}", 12345000000));
      assertEquals("123.4500",       Strings.format("{0:f4}", 123.45));
      assertEquals("123.45",         Strings.format("{0:F2}", 123.45));
      assertEquals("12,345.00",      Strings.format("{0:n}", 12345));
      assertEquals("12,345.0001",    Strings.format("{0:N4}", 12345.0001));
      assertEquals("ff",             Strings.format("{0:x}", 255));
      assertEquals("00ff",           Strings.format("{0:x4}", 255));
      assertEquals("000FF",          Strings.format("{0:X5}", 255));
    }

		private function run_tests(tests:Array):void {
			var pass:int, fail:int, i:int, s:String, t:Object, b:Boolean;
			for (pass=fail=i=0; i<tests.length; ++i) {
				t = tests[i];
				s = Strings.format("{0"+t.format+"}", t.input);
				assertEquals(t.result, s, t.format);
			}
		}


  }
}


