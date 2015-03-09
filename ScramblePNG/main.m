//
//  main.m
//  ScramblePNG
//
//  Created by neokoala on 2015. 3. 9..
//  Copyright (c) 2015년 nowApp. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCRAMBLE_BYTE_LEN           128

char scramble_key[] = "my scramble key";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        int i;
        int keyLen = (int)strlen(scramble_key);
        NSString *inFileName = @"/Users/neokoala/Documents/CocosProjects/ScramblePNG/hiragana.png";
        NSString *outFileName = @"/Users/neokoala/Documents/CocosProjects/ScramblePNG/hiragana_s.png";

        NSData *data = [NSData dataWithContentsOfFile:inFileName];
        unsigned char *buf = (unsigned char *)[data bytes];
        for (i=0; i<SCRAMBLE_BYTE_LEN; i++)
        {
            buf[i] ^= scramble_key[i%keyLen];
        }
            
        [data writeToFile:outFileName atomically:YES];
    }

    return 0;
}

#if 0

// Cocos2d-x code
// *.png(scramble된),*.plist를 SpriteCache에 등록하는 예제입니다.

void unscramblePNG(void)
{
    Texture2D *texture;

    int keyLen = strlen(scramble_key);

    {
        std::string _filePath = FileUtils::getInstance()->fullPathForFilename("hiragana_s.png");
        Data data = FileUtils::getInstance()->getDataFromFile(_filePath);
        
        if (!data.isNull())
        {
            // de scramble..
            unsigned char *buf = data.getBytes();
            for (int i=0; i<SCRAMBLE_BYTE_LEN; i++)
            {
                buf[i] ^= scramble_key[i%keyLen];
            }
            
            Image *image = new Image;
            image->initWithImageData(data.getBytes(), data.getSize());
            texture = Director::getInstance()->getTextureCache()->addImage(image, _filePath);
        }
    }
    
    sprintf(tmpStr, "Game/vampFont%d.plist", i);
    SpriteFrameCache::getInstance()->addSpriteFramesWithFile("hiragana.plist", texture);

}
#endif