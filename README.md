# Проект: "Выпуск NFT"
Выполнил: Елесин Сергей  
Группа: БПИ-193

## Цель проекта
Разработать смарт-контракт для реализации маркетплейса неразменных токенов.

## Технологический стек
- Платформа: Avalanche
- Фреймворк: Truffle
- Язык программирования: Solidity

## Описание проекта
Данный смарт-контракт позволяет:
- создавать NFT с указанием 'royalty' (отчисление создателю от 10% до 25%) (функция createCollectible в Collectible.sol)
- размещать NFT для покупки за указанную цену (функция listItem в Marketplace.sol)
- отменять размещение NFT для покупки (функция cancelListing в Marketplace.sol)
- осуществлять покупку NFT (функция buyItem в Marketplace.sol)

## Как запустить
Данный смарт-контракт предназначен для запуска в тестовой сети Avalanche Fuji Testnet.

Для запуска клонируйте/скачайте данный репозиторий и запустите следующие команды.
```shell
npm install
npm run
```
Важно: Вам необходимо будет указать свой пароль от Metamask в переменных окружения (MNEMONIC=<Ваш пароль из 12 слов>)