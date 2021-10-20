using Xunit;
namespace Day05
{

    public class Tests
    {
        [Theory]
        [InlineData("FBFBBFFRLR", 44)]
        public void DecodePass(string pass, int expected) 
        {
            Assert.Equal(expected, int.Parse(pass));
        }
    }
}
