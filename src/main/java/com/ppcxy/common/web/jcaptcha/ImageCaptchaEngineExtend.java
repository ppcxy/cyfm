package com.ppcxy.common.web.jcaptcha;

/**
 * 自定义验证码内容样式
 * 
 * @author shadow
 * @email 124010356@qq.com
 */

public class ImageCaptchaEngineExtend extends ListImageCaptchaEngine {
           
         protected void buildInitialFactories() {

		// build filters
			 WaterFilter water = new WaterFilter();

		water.setAmplitude(3d);
		water.setAntialias(true);
		water.setPhase(20d);
		water.setWavelength(70d);

		ImageDeformation backDef = new ImageDeformationByFilters(
				new ImageFilter[] {});
		ImageDeformation textDef = new ImageDeformationByFilters(
				new ImageFilter[] {});
		ImageDeformation postDef = new ImageDeformationByFilters(
				new ImageFilter[] { water });

		// word generator
		WordGenerator dictionnaryWords = new RandomWordGenerator(
				"abcdefhjkmnprstuvwxyz23456789");
		// wordtoimage components
		RandomRangeColorGenerator colors = new RandomRangeColorGenerator(
				new int[] { 0, 150 }, new int[] { 0, 150 },
				new int[] { 0, 150 });

		// Arial,Tahoma,Verdana,Helvetica,宋体,黑体,幼圆
		Font[] fonts = new Font[] { new Font("Arial", 0, 15),
				new Font("Tahoma", 0, 15), new Font("Verdana", 0, 15),
				new Font("Helvetica", 0, 15), new Font("宋体", 0, 15),
				new Font("黑体", 0, 15), new Font("幼圆", 0, 15) };

		// 设置字符以及干扰线
		RandomRangeColorGenerator lineColors = new RandomRangeColorGenerator(
				new int[] { 150, 255 }, new int[] { 150, 255 }, new int[] {
						150, 255 });

		TextPaster randomPaster = new DecoratedRandomTextPaster(new Integer(4),
				new Integer(4), colors, true,
				new TextDecorator[] { new LineTextDecorator(new Integer(1),
						lineColors) });
		BackgroundGenerator back = new UniColorBackgroundGenerator(new Integer(
				140), new Integer(45), Color.white);

		FontGenerator shearedFont = new RandomFontGenerator(new Integer(30),
				new Integer(0), fonts);
		// word2image 1
		WordToImage word2image;
		word2image = new DeformedComposedWordToImage(shearedFont, back,
				randomPaster, backDef, textDef, postDef);

		this.addFactory(new GimpyFactory(dictionnaryWords, word2image));

	}
}
