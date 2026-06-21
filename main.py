from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from pymongo import MongoClient

app = FastAPI()

# !!! SEM VLOŽ SVŮJ PŘIPOJOVACÍ ŘETĚZEC Z MONGODB ATLAS !!!
MONGO_URI = "mongodb+srv://UZIVATEL:HESLO@cluster.xxxx.mongodb.net/?retryWrites=true&w=majority"

client = MongoClient(MONGO_URI)
db = client["loader_system"]
keys_collection = db["keys"]

class VerifyRequest(BaseModel):
    key: str
    hwid: str

@app.post("/verify")
def verify_key(request: VerifyRequest):
    # Hledání klíče v databázi
    key_data = keys_collection.find_one({"key": request.key})
    
    if not key_data:
        raise HTTPException(status_code=400, detail="Neplatny klic!")
        
    if key_data.get("banned", False):
        raise HTTPException(status_code=403, detail="Tento klic byl zablokovan!")

    # Kontrola HWID (Zámek na jedno PC)
    db_hwid = key_data.get("hwid")
    if not db_hwid:
        # Pokud klíč nemá HWID, přiřadíme mu HWID aktuálního PC
        keys_collection.update_one({"key": request.key}, {"$set": {"hwid": request.hwid}})
    elif db_hwid != request.hwid:
        raise HTTPException(status_code=401, detail="HWID se neshoduje!")

    return {"status": "success", "message": "Access granted", "expires": key_data.get("expires")}
