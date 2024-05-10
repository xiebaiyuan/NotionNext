import xml.etree.ElementTree as ET
import requests


def extract_sitemap_locs(url):
    # 发送请求获取sitemap
    response = requests.get(url)
    response.raise_for_status()  # 确保请求成功

    # 解析 XML
    root = ET.fromstring(response.content)

    # 提取所有的 loc 标签
    locs = [elem.text for elem in root.findall('.//{http://www.sitemaps.org/schemas/sitemap/0.9}loc')]

    return locs


# 示例：使用示例 URL
sitemap_url = 'https://xiebaiyuan.top/sitemap.xml'
locs = extract_sitemap_locs(sitemap_url)
print("Extracted URLs:", locs)

# 每行打印一个 URL
for loc in locs:
    print(loc)
