# apt-mandelbot

APT repository for [mandelbot](https://github.com/astex/mandelbot).

## Usage

```bash
curl -fsSL https://astex.github.io/apt-mandelbot/key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/mandelbot.gpg

echo "deb [signed-by=/usr/share/keyrings/mandelbot.gpg] https://astex.github.io/apt-mandelbot stable main" | sudo tee /etc/apt/sources.list.d/mandelbot.list

sudo apt update && sudo apt install mandelbot
```
