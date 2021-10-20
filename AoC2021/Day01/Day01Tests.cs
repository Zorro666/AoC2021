using Xunit;

namespace Day01
{
    public class Tests
    {
        [Theory]
        [InlineData(new int[]
{
1456
            }, 514579)]
        public void SumTwo(int[] values, int expected)
        {
            Assert.Equal(expected, values[0]);
        }
    }
}
