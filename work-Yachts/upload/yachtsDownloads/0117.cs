using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            //DateTime ，用於表示日期和時間。它包含了多個屬性，包括年、月、日、時、分、秒等
            //1.取得日期的不同部分：
            //DateTime now = DateTime.Now;

            //int year = now.Year;
            //int month = now.Month;
            //int day = now.Day;
            //int hour = now.Hour;
            //int minute = now.Minute;
            //int second = now.Second;

            //Console.WriteLine($"現在時間：{now}");
            //Console.WriteLine($"{year}年，：{month}月，：{day}日，：{hour}時，：{minute}分，：{second}秒");
            //Console.ReadKey();



            //2.日期的計算：
            //DateTime now = DateTime.Now;

            //DateTime futureDate = now.AddMonths(3); // 未來三個月的日期
            //DateTime pastDate = now.AddDays(-2);  // 過去兩個月的日期

            //Console.WriteLine($"現在時間：{now}");
            //Console.WriteLine($"未來三個月的日期：{futureDate}");
            //Console.WriteLine($"過去兩天的日期：{pastDate}");
            //Console.ReadKey();


            //3.禮拜幾
            ////DateTime today = DateTime.Today;
            ////DayOfWeek dayOfWeek = today.DayOfWeek;
            ////Console.WriteLine($"今天是{dayOfWeek}");
            ////Console.ReadKey();

            //4日期減法
            DateTime today = DateTime.Today;
            DateTime targetDate = new DateTime(today.Year, 2, 9);

           // 計算距離目標日期還有多少天
           int newyear = (int)(targetDate - today).TotalDays;

           Console.WriteLine($"今天是 {today:yyyy年MM月dd日}，距離過年2月9日還有 {newyear} 天。");
           Console.ReadKey();

            //--------亂數Random--------
            //Random 類別用於生成擁有隨機性的數值。這些數值可以是整數、浮點數、字串
            // 能夠模擬隨機性的行為，如遊戲中的隨機事件、數據的混淆等。

            //1.從49個數字中亂數生成1個
            //Random random = new Random();
            //int randomNumber = random.Next(1, 49);
            //Console.WriteLine(randomNumber);
            //Console.ReadKey();

            //2.隨機生成一個日期

            //Random random = new Random();

            //// 取得當前日期
            //DateTime nowday = DateTime.Now;

            //// 生成隨機的天數（0 到 365）
            //int randomDays = random.Next(366);

            //// 使用 AddDays 方法計算隨機日期
            //DateTime randomDate = nowday.AddDays(randomDays);

            //Console.WriteLine($"你今年的幸運日是：{randomDate:yyyy年MM月dd日}");
            //Console.ReadKey();
        }
    }
}