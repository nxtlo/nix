import asyncio
import httpx


URL = 'https://api.github.com/users'
PULL = 'https://api.github.com/repos'

async def request(user: str = None):
    '''
    a Simple async http client to create a request for the github api
    for testing purpose.
    '''
    async with httpx.AsyncClient() as client:
        data = await client.get(f"{URL}/{user}", headers={})
        if data.status_code == 200:
            with open('../lib/content.json', 'w', encoding='utf-8') as out:
                try:
                    out.write(data.json())
                except Exception:
                    out.write(data.text)
                finally:
                    out.close()

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(request("nxtlo"))
